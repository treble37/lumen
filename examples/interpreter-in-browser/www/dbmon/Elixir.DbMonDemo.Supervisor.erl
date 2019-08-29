-file("lib/db_mon_demo/supervisor.ex", 1).

-module('Elixir.DbMonDemo.Supervisor').

-export(['MACRO-__using__'/2,'__info__'/1,start_link/2,start_link/3]).

-spec '__info__'(attributes |
                 compile |
                 functions |
                 macros |
                 md5 |
                 module |
                 deprecated) ->
                    any().

'__info__'(module) ->
    'Elixir.DbMonDemo.Supervisor';
'__info__'(functions) ->
    [{start_link,2},{start_link,3}];
'__info__'(macros) ->
    [{'__using__',1}];
'__info__'(Key = attributes) ->
    erlang:get_module_info('Elixir.DbMonDemo.Supervisor', Key);
'__info__'(Key = compile) ->
    erlang:get_module_info('Elixir.DbMonDemo.Supervisor', Key);
'__info__'(Key = md5) ->
    erlang:get_module_info('Elixir.DbMonDemo.Supervisor', Key);
'__info__'(deprecated) ->
    [].

'MACRO-__using__'(_@CALLER, __opts@1) ->
    {'__block__',
     [],
     [{def,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{child_spec,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{opts,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {'%{}',
           [],
           [{id,{'__MODULE__',[],'Elixir.DbMonDemo.Supervisor'}},
            {start,
             {'{}',
              [],
              [{'__MODULE__',[],'Elixir.DbMonDemo.Supervisor'},
               start_link,
               [{opts,[],'Elixir.DbMonDemo.Supervisor'}]]}},
            {type,supervisor},
            {restart,temporary},
            {shutdown,500}]}}]]},
      {def,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{init_it,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
          {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
          {args,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {'__block__',
           [],
           [{'=',
             [],
             [{'{}',
               [],
               [ok,
                {children,[],'Elixir.DbMonDemo.Supervisor'},
                {state,[],'Elixir.DbMonDemo.Supervisor'}]},
              {apply,
               [{context,'Elixir.DbMonDemo.Supervisor'},
                {import,'Elixir.Kernel'}],
               [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
                init,
                [{args,[],'Elixir.DbMonDemo.Supervisor'}]]}]},
            {'=',
             [],
             [{child_list,[],'Elixir.DbMonDemo.Supervisor'},
              {sup_children,
               [],
               [{children,[],'Elixir.DbMonDemo.Supervisor'}]}]},
            {loop,
             [],
             [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
              {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
              {child_list,[],'Elixir.DbMonDemo.Supervisor'},
              {state,[],'Elixir.DbMonDemo.Supervisor'}]}]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{loop,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
          {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
          {children,[],'Elixir.DbMonDemo.Supervisor'},
          {state,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {'receive',
           [],
           [[{do,
              [{'->',
                [],
                [[{msg,[],'Elixir.DbMonDemo.Supervisor'}],
                 {handle_msg,
                  [],
                  [{msg,[],'Elixir.DbMonDemo.Supervisor'},
                   {'{}',
                    [],
                    [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
                     {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
                     {children,[],'Elixir.DbMonDemo.Supervisor'},
                     {state,[],'Elixir.DbMonDemo.Supervisor'}]}]}]}]}]]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{sup_children,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{children,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {'|>',
           [{context,'Elixir.DbMonDemo.Supervisor'},
            {import,'Elixir.Kernel'}],
           [{{'.',[],[{'__aliases__',[{alias,false}],['Enum']},reduce]},
             [],
             [{children,[],'Elixir.DbMonDemo.Supervisor'},
              {[],0},
              {fn,
               [],
               [{'->',
                 [],
                 [[{{mod,[],'Elixir.DbMonDemo.Supervisor'},
                    {args,[],'Elixir.DbMonDemo.Supervisor'}},
                   {{children,[],'Elixir.DbMonDemo.Supervisor'},
                    {index,[],'Elixir.DbMonDemo.Supervisor'}}],
                  {'__block__',
                   [],
                   [{'=',
                     [],
                     [{ok,{pid,[],'Elixir.DbMonDemo.Supervisor'}},
                      {restart_child,
                       [],
                       [{mod,[],'Elixir.DbMonDemo.Supervisor'},
                        {args,[],'Elixir.DbMonDemo.Supervisor'}]}]},
                    {'=',
                     [],
                     [{children,[],'Elixir.DbMonDemo.Supervisor'},
                      {insert_child_at,
                       [],
                       [{children,[],'Elixir.DbMonDemo.Supervisor'},
                        {'{}',
                         [],
                         [{pid,[],'Elixir.DbMonDemo.Supervisor'},
                          {mod,[],'Elixir.DbMonDemo.Supervisor'},
                          {args,[],'Elixir.DbMonDemo.Supervisor'}]},
                        {index,[],'Elixir.DbMonDemo.Supervisor'}]}]},
                    {{children,[],'Elixir.DbMonDemo.Supervisor'},
                     {'+',
                      [{context,'Elixir.DbMonDemo.Supervisor'},
                       {import,'Elixir.Kernel'}],
                      [{index,[],'Elixir.DbMonDemo.Supervisor'},1]}}]}]}]}]},
            {elem,[],[0]}]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{restart_child,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{mod,[],'Elixir.DbMonDemo.Supervisor'},
          {args,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {'__block__',
           [],
           [{'=',
             [],
             [{ok,
               {'{}',
                [],
                [{module,[],'Elixir.DbMonDemo.Supervisor'},
                 {function_name,[],'Elixir.DbMonDemo.Supervisor'},
                 {args,[],'Elixir.DbMonDemo.Supervisor'}]}},
              {'|>',
               [{context,'Elixir.DbMonDemo.Supervisor'},
                {import,'Elixir.Kernel'}],
               [{'|>',
                 [{context,'Elixir.DbMonDemo.Supervisor'},
                  {import,'Elixir.Kernel'}],
                 [{mod,[],'Elixir.DbMonDemo.Supervisor'},
                  {apply,
                   [{context,'Elixir.DbMonDemo.Supervisor'},
                    {import,'Elixir.Kernel'}],
                   [child_spec,
                    [{args,[],'Elixir.DbMonDemo.Supervisor'}]]}]},
                {{'.',
                  [],
                  [{'__aliases__',[{alias,false}],['Map']},fetch]},
                 [],
                 [start]}]}]},
            {apply,
             [{context,'Elixir.DbMonDemo.Supervisor'},
              {import,'Elixir.Kernel'}],
             [{module,[],'Elixir.DbMonDemo.Supervisor'},
              {function_name,[],'Elixir.DbMonDemo.Supervisor'},
              {args,[],'Elixir.DbMonDemo.Supervisor'}]}]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{insert_child_at,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{children,[],'Elixir.DbMonDemo.Supervisor'},
          {child,[],'Elixir.DbMonDemo.Supervisor'},
          {index,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {{'.',[],[{'__aliases__',[{alias,false}],['List']},insert_at]},
           [],
           [{children,[],'Elixir.DbMonDemo.Supervisor'},
            {index,[],'Elixir.DbMonDemo.Supervisor'},
            {child,[],'Elixir.DbMonDemo.Supervisor'}]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{handle_msg,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{'{}',
           [],
           [system,
            {{to,[],'Elixir.DbMonDemo.Supervisor'},
             {tag,[],'Elixir.DbMonDemo.Supervisor'}},
            {'=',
             [],
             [{terminate,{reason,[],'Elixir.DbMonDemo.Supervisor'}},
              {msg,[],'Elixir.DbMonDemo.Supervisor'}]}]},
          {'{}',
           [],
           [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
            {'_parent_proc',[],'Elixir.DbMonDemo.Supervisor'},
            {'_children',[],'Elixir.DbMonDemo.Supervisor'},
            {state,[],'Elixir.DbMonDemo.Supervisor'}]}]},
        [{do,
          {'__block__',
           [],
           [{send,
             [{context,'Elixir.DbMonDemo.Supervisor'},
              {import,'Elixir.Kernel'}],
             [{to,[],'Elixir.DbMonDemo.Supervisor'},
              {{tag,[],'Elixir.DbMonDemo.Supervisor'},ok}]},
            {apply,
             [{context,'Elixir.DbMonDemo.Supervisor'},
              {import,'Elixir.Kernel'}],
             [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
              terminate,
              [{reason,[],'Elixir.DbMonDemo.Supervisor'},
               {state,[],'Elixir.DbMonDemo.Supervisor'}]]}]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{handle_msg,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{'{}',
           [],
           ['$gen_call',
            {'=',
             [],
             [{{to,[],'Elixir.DbMonDemo.Supervisor'},
               {tag,[],'Elixir.DbMonDemo.Supervisor'}},
              {from,[],'Elixir.DbMonDemo.Supervisor'}]},
            {msg,[],'Elixir.DbMonDemo.Supervisor'}]},
          {'{}',
           [],
           [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
            {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
            {children,[],'Elixir.DbMonDemo.Supervisor'},
            {state,[],'Elixir.DbMonDemo.Supervisor'}]}]},
        [{do,
          {'case',
           [],
           [{handle_call,
             [],
             [{msg,[],'Elixir.DbMonDemo.Supervisor'},
              {from,[],'Elixir.DbMonDemo.Supervisor'},
              {state,[],'Elixir.DbMonDemo.Supervisor'}]},
            [{do,
              [{'->',
                [],
                [[{'{}',
                   [],
                   [reply,
                    {return_val,[],'Elixir.DbMonDemo.Supervisor'},
                    {new_state,[],'Elixir.DbMonDemo.Supervisor'}]}],
                 {'__block__',
                  [],
                  [{send,
                    [{context,'Elixir.DbMonDemo.Supervisor'},
                     {import,'Elixir.Kernel'}],
                    [{to,[],'Elixir.DbMonDemo.Supervisor'},
                     {{tag,[],'Elixir.DbMonDemo.Supervisor'},
                      {return_val,[],'Elixir.DbMonDemo.Supervisor'}}]},
                   {loop,
                    [],
                    [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
                     {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
                     {children,[],'Elixir.DbMonDemo.Supervisor'},
                     {new_state,[],'Elixir.DbMonDemo.Supervisor'}]}]}]}]}]]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{handle_msg,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{'{}',
           [],
           ['EXIT',
            {from,[],'Elixir.DbMonDemo.Supervisor'},
            {reason,[],'Elixir.DbMonDemo.Supervisor'}]},
          {'{}',
           [],
           [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
            {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
            {children,[],'Elixir.DbMonDemo.Supervisor'},
            {state,[],'Elixir.DbMonDemo.Supervisor'}]}]},
        [{do,
          {'case',
           [],
           [{fetch_child_from_pid,
             [],
             [{children,[],'Elixir.DbMonDemo.Supervisor'},
              {from,[],'Elixir.DbMonDemo.Supervisor'}]},
            [{do,
              [{'->',
                [],
                [[error],
                 {exit,
                  [{context,'Elixir.DbMonDemo.Supervisor'},
                   {import,'Elixir.Kernel'}],
                  [shutdown]}]},
               {'->',
                [],
                [[{{'{}',
                    [],
                    [{'_pid',[],'Elixir.DbMonDemo.Supervisor'},
                     {mod,[],'Elixir.DbMonDemo.Supervisor'},
                     {args,[],'Elixir.DbMonDemo.Supervisor'}]},
                   {index,[],'Elixir.DbMonDemo.Supervisor'}}],
                 {'__block__',
                  [],
                  [{'=',
                    [],
                    [{ok,{pid,[],'Elixir.DbMonDemo.Supervisor'}},
                     {restart_child,
                      [],
                      [{mod,[],'Elixir.DbMonDemo.Supervisor'},
                       {args,[],'Elixir.DbMonDemo.Supervisor'}]}]},
                   {'=',
                    [],
                    [{children,[],'Elixir.DbMonDemo.Supervisor'},
                     {insert_child_at,
                      [],
                      [{children,[],'Elixir.DbMonDemo.Supervisor'},
                       {'{}',
                        [],
                        [{pid,[],'Elixir.DbMonDemo.Supervisor'},
                         {mod,[],'Elixir.DbMonDemo.Supervisor'},
                         {args,[],'Elixir.DbMonDemo.Supervisor'}]},
                       {index,[],'Elixir.DbMonDemo.Supervisor'}]}]},
                   {loop,
                    [],
                    [{gen_mod,[],'Elixir.DbMonDemo.Supervisor'},
                     {parent_proc,[],'Elixir.DbMonDemo.Supervisor'},
                     {children,[],'Elixir.DbMonDemo.Supervisor'},
                     {state,[],'Elixir.DbMonDemo.Supervisor'}]}]}]}]}]]}}]]},
      {defp,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{fetch_child_from_pid,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{children,[],'Elixir.DbMonDemo.Supervisor'},
          {pid,[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,
          {'|>',
           [{context,'Elixir.DbMonDemo.Supervisor'},
            {import,'Elixir.Kernel'}],
           [{{'.',
              [],
              [{'__aliases__',[{alias,false}],['Enum']},reduce_while]},
             [],
             [{children,[],'Elixir.DbMonDemo.Supervisor'},
              {error,0},
              {fn,
               [],
               [{'->',
                 [],
                 [[{'=',
                    [],
                    [{'{}',
                      [],
                      [{'^',[],[{pid,[],'Elixir.DbMonDemo.Supervisor'}]},
                       {child_mod,[],'Elixir.DbMonDemo.Supervisor'},
                       {child_args,[],'Elixir.DbMonDemo.Supervisor'}]},
                     {child,[],'Elixir.DbMonDemo.Supervisor'}]},
                   {error,{index,[],'Elixir.DbMonDemo.Supervisor'}}],
                  {halt,
                   {{child,[],'Elixir.DbMonDemo.Supervisor'},
                    {index,[],'Elixir.DbMonDemo.Supervisor'}}}]},
                {'->',
                 [],
                 [[{'{}',
                    [],
                    [{'_pid',[],'Elixir.DbMonDemo.Supervisor'},
                     {'_child_mod',[],'Elixir.DbMonDemo.Supervisor'},
                     {'_child_args',[],'Elixir.DbMonDemo.Supervisor'}]},
                   {error,{index,[],'Elixir.DbMonDemo.Supervisor'}}],
                  {cont,
                   {error,
                    {'+',
                     [{context,'Elixir.DbMonDemo.Supervisor'},
                      {import,'Elixir.Kernel'}],
                     [{index,[],'Elixir.DbMonDemo.Supervisor'},1]}}}]}]}]},
            {'case',
             [],
             [[{do,
                [{'->',
                  [],
                  [[{error,{'_index',[],'Elixir.DbMonDemo.Supervisor'}}],
                   error]},
                 {'->',
                  [],
                  [[{match,[],'Elixir.DbMonDemo.Supervisor'}],
                   {match,[],'Elixir.DbMonDemo.Supervisor'}]}]}]]}]}}]]},
      {def,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [{terminate,
         [{context,'Elixir.DbMonDemo.Supervisor'}],
         [{'_reason',[],'Elixir.DbMonDemo.Supervisor'},
          {'_state',[],'Elixir.DbMonDemo.Supervisor'}]},
        [{do,ok}]]},
      {defoverridable,
       [{context,'Elixir.DbMonDemo.Supervisor'},
        {import,'Elixir.Kernel'}],
       [[{terminate,2}]]}]}.

start_link(__@1, __@2) ->
    start_link(__@1, __@2, []).

start_link(_gen_mod@1, _args@1, _opts@1) ->
    _pid@1 =
        spawn_link(_gen_mod@1, init_it, [_gen_mod@1,self(),_args@1]),
    _name@1 = 'Elixir.Keyword':get(_opts@1, name),
    case _name@1 of
        __@1
            when
                __@1 =:= nil
                orelse
                __@1 =:= false ->
            nil;
        _ ->
            register(_name@1, _pid@1)
    end,
    {ok,_pid@1}.

