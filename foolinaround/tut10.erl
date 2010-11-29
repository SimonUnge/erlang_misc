-module(tut10).
-export([convert_length/1]).

convert_length(Length) ->
    case Length of
	{c, X} ->
	    {i, X / 2.54};
	{i, Y} ->
	    {c, Y * 2.54}
	end.
