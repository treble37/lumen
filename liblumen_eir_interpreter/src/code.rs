use std::convert::TryInto;
use std::sync::Arc;

use cranelift_entity::EntityRef;
use libeir_ir::Block;

use liblumen_alloc::erts::exception::runtime::{Class, Exception};
use liblumen_alloc::erts::process::code::stack::frame::Frame;
use liblumen_alloc::erts::process::code::{result_from_exception, Result};
use liblumen_alloc::erts::process::ProcessControlBlock;
use liblumen_alloc::erts::term::{Atom, Term, TypedTerm};
use liblumen_alloc::erts::ModuleFunctionArity;

use crate::exec::CallExecutor;

pub fn return_throw(arc_process: &Arc<ProcessControlBlock>) -> Result {
    let class_term = arc_process.stack_pop().unwrap();
    let reason_term = arc_process.stack_pop().unwrap();
    let trace_term = arc_process.stack_pop().unwrap();

    let class: Atom = class_term.try_into().unwrap();
    let class = match class.name() {
        "EXIT" => Class::Exit,
        _ => unreachable!(),
    };

    let exc = Exception {
        class,
        reason: reason_term,
        stacktrace: Some(trace_term),
        file: "",
        line: 0,
        column: 0,
    };
    result_from_exception(arc_process, exc.into())
}

pub fn return_ok(arc_process: &Arc<ProcessControlBlock>) -> Result {
    let result_term = arc_process.stack_pop().unwrap();
    arc_process.return_from_call(result_term)?;
    ProcessControlBlock::call_code(arc_process)
}

/// Expects the following on stack:
/// * module atom
/// * function atom
/// * arity integer
/// * argument list
pub fn interpreter_mfa_code(arc_process: &Arc<ProcessControlBlock>) -> Result {
    let module_term = arc_process.stack_pop().unwrap();
    let function_term = arc_process.stack_pop().unwrap();
    let argument_list = arc_process.stack_pop().unwrap();

    let module: Atom = module_term.try_into().unwrap();
    let function: Atom = function_term.try_into().unwrap();

    let mut argument_vec: Vec<Term> = Vec::new();
    match argument_list.to_typed_term().unwrap() {
        TypedTerm::Nil => (),
        TypedTerm::List(argument_cons) => {
            for result in argument_cons.into_iter() {
                let element = result.unwrap();

                argument_vec.push(element);
            }
        }
        _ => panic!(),
    }

    let mut exec = CallExecutor::new();
    exec.call(
        &crate::VM,
        arc_process,
        module,
        function,
        argument_vec.len() - 2,
        &argument_vec,
    )
}

/// Expects the following on stack:
/// * module atom
/// * function atom
/// * arity integer
/// * argument list
/// * block id integer
/// * environment list
pub fn interpreter_closure_code(arc_process: &Arc<ProcessControlBlock>) -> Result {
    let module_term = arc_process.stack_pop().unwrap();
    let function_term = arc_process.stack_pop().unwrap();
    let arity_term = arc_process.stack_pop().unwrap();
    let argument_list = arc_process.stack_pop().unwrap();
    let block_id_term = arc_process.stack_pop().unwrap();
    let environment_list = arc_process.stack_pop().unwrap();

    let module: Atom = module_term.try_into().unwrap();
    let function: Atom = function_term.try_into().unwrap();
    let arity: usize = arity_term.try_into().unwrap();

    let block_id: usize = block_id_term.try_into().unwrap();
    let block = Block::new(block_id);

    let mut argument_vec: Vec<Term> = Vec::new();
    match argument_list.to_typed_term().unwrap() {
        TypedTerm::Nil => (),
        TypedTerm::List(argument_cons) => {
            for result in argument_cons.into_iter() {
                let element = result.unwrap();

                argument_vec.push(element);
            }
        }
        _ => panic!(),
    }

    let mut environment_vec: Vec<Term> = Vec::new();
    match environment_list.to_typed_term().unwrap() {
        TypedTerm::Nil => (),
        TypedTerm::List(env_cons) => {
            for result in env_cons.into_iter() {
                let element = result.unwrap();

                environment_vec.push(element);
            }
        }
        _ => panic!(),
    }

    let mut exec = CallExecutor::new();
    exec.call_block(
        &crate::VM,
        arc_process,
        module,
        function,
        arity,
        &argument_vec,
        block,
        &environment_vec,
    )
}

pub fn apply(arc_process: &Arc<ProcessControlBlock>) -> Result {
    let module_term = arc_process.stack_pop().unwrap();
    let function_term = arc_process.stack_pop().unwrap();
    let argument_list = arc_process.stack_pop().unwrap();

    let module: Atom = module_term.try_into().unwrap();
    let function: Atom = function_term.try_into().unwrap();

    let arity;
    match argument_list.to_typed_term().unwrap() {
        TypedTerm::Nil => arity = 0,
        TypedTerm::List(argument_cons) => arity = argument_cons.into_iter().count(),
        _ => panic!(),
    }

    let module_function_arity = Arc::new(ModuleFunctionArity {
        module,
        function,
        arity: arity.try_into().unwrap(),
    });

    let frame = Frame::new(module_function_arity, interpreter_mfa_code);

    arc_process.stack_push(argument_list)?;
    arc_process.stack_push(function_term)?;
    arc_process.stack_push(module_term)?;
    arc_process.replace_frame(frame);

    ProcessControlBlock::call_code(arc_process)
}
