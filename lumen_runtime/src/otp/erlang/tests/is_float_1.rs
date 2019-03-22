use super::*;

use std::sync::{Arc, RwLock};

use num_traits::Num;

use crate::environment::{self, Environment};
use crate::process::IntoProcess;

#[test]
fn with_atom_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::str_to_atom("number", Existence::DoNotCare, &mut process).unwrap();

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_local_reference_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::local_reference(&mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_empty_list_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::EMPTY_LIST;

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_list_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = list_term(&mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_small_integer_is_true() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = 0usize.into_process(&mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_big_integer_is_true() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = <BigInt as Num>::from_str_radix("576460752303423489", 10)
        .unwrap()
        .into_process(&mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_float_is_true() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = 1.0.into_process(&mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        true.into_process(&mut process),
        process
    );
}

#[test]
fn with_local_pid_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::local_pid(0, 0, &mut process).unwrap();

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_external_pid_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::external_pid(1, 0, 0, &mut process).unwrap();

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_tuple_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::slice_to_tuple(&[], &mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_map_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::slice_to_map(&[], &mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_heap_binary_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let term = Term::slice_to_binary(&[], &mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}

#[test]
fn with_subbinary_is_false() {
    let environment_rw_lock: Arc<RwLock<Environment>> = Default::default();
    let process_rw_lock = environment::process(Arc::clone(&environment_rw_lock));
    let mut process = process_rw_lock.write().unwrap();
    let original = Term::slice_to_binary(&[0b0000_00001, 0b1111_1110, 0b1010_1011], &mut process);
    let term = Term::subbinary(original, 0, 7, 2, 1, &mut process);

    assert_eq_in_process!(
        erlang::is_float_1(term, &mut process),
        false.into_process(&mut process),
        process
    );
}
