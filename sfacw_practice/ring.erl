-module(ring).
-compile(export_all).

start(N,M) ->
    statistics(runtime),
    statistics(wall_clock),
    Startpid = self(),
    Pid = spawn(fun() -> ring(N, N, M, self(), Startpid) end),
    Pid ! start,
    receive
	done ->
	    io:format("Received Done~n",[])
    end,
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1,
    U2 = Time2,
    io:format("Time taken: ~p and ~p~n",[U1, U2]).

ring(N, N, M, _, Startpid) ->
    FirstNode = self(),
    Pid = spawn(fun() -> ring(N-1,M, FirstNode, Startpid) end),
    %%io:format("I am the first Node~n"),
    loop(M, Pid, Startpid,N).

ring(N, M, FirstNode, Startpid) when N > 1 ->
    Pid = spawn(fun() -> ring(N-1,M, FirstNode, Startpid) end),
    %%io:format("I am node nr: ~p~n",[N]),
    loop(M, Pid, Startpid,N);
ring(1, M, FirstNode, Startpid) ->
    %%io:format("And I am the last node!~n"),
    loop(M, FirstNode, Startpid,1).


loop(M, To, Startpid,N) when M >= 1 ->
    receive
	Any ->
	    %%io:format("Received ~p, and I am node nr ~p~n", [Any, N]),
	    To ! hello,
	    loop(M-1, To, Startpid, N)
    end;
loop(M, _, Startpid, N) when M =:= 0->
    receive
	Any ->
	    %%io:format("Last receive ~p, and I am node nr ~p~n", [Any, N]),
	    Startpid ! done
    end.
