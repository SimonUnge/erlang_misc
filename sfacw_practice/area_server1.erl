-module(area_server1).
-export([loop/0, rpg/2]).

loop() ->
    receive
	{From, {rectangle, Width, Ht}} ->
	    From ! Width * Ht,
	    loop();
	{From, {circle, R}} ->
	    From ! 3.14159 * R * R,
	    loop();
	{From, Other} ->
	    From ! {error, Other},
	    loop()
    end.
