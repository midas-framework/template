-module (pool_native).
-export ([spawn_link/1]).

spawn_link(OptionsList) ->
  Options = maps:from_list([ {K, erlang:binary_to_list(V)} || {K, V} <- OptionsList]),
  {ok, Pid} = pgo_pool:start_link(default, Options),
  Pid.
