-module(geometry).
-export([area/1]).
-define(pi,3.14159).


area({rectangle, Width, Ht}) ->
    Width * Ht;
area({circle, R}) ->
    ?pi * R * R;
area({square, X) ->
	    X * X.
