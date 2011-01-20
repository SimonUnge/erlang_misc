-module(kvs).
-export([start/0, store/2, lookup/1]).

start() ->
    register(kvs, spawn(fun() -> loop() end)).

store(Key, Value) ->
    rcp({store, Key, Value}).

lookup(Key) ->
    rcp({lookup, Key}).

rcp(Q) ->
    kvs ! {self(), Q},
    receive
	{kvs, Reply} ->
	    Reply
    end.

loop() ->
    receive
	{From, {store, Key, Value}} ->
	    put(Key, {ok, Value}),
	    From ! {kvs, true},
	    loop();
	{From, {lookup, Key}} ->
	    From ! {kvs, get(Key)},
	    loop()
    end.
