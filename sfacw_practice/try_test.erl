-module(try_test).
-export([generate_exceptions/1, demo1/0, demo2/0, demo3/0, catcher/1]).

generate_exceptions(1) ->
    a;
generate_exceptions(2) ->
    throw(a);
generate_exceptions(3) ->
    exit(a);
generate_exceptions(4) ->
    {'EXIT', a};
generate_exceptions(5) ->
    erlang:error(a).

demo1() ->
    [catcher(I) || I <- [1,2,3,4,5]].

demo2() ->
    [{I, (catch generate_exceptions(I))} || I <- [1,2,3,4,5]].

demo3() ->
    try generate_exceptions(5)
    catch
	error:X ->
	    {X, erlang:get_stacktrace()}
    end.

catcher(N) ->
	try generate_exceptions(N) of
	    Val -> {N, normal, Val}
	catch
	    throw:X -> {N, caught, thrown, X};
	    exit:X  -> {N, caught, exited, X};
	    error:X -> {N, caught, error, X}
	end.

