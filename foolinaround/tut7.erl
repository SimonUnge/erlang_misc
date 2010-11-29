-module(tut7).
-export([format_temps/1]).

format_temps(List_of_cities) ->
    Converted_list = convert_list_to_c(List_of_cities),
    print_temp(Converted_list),
    {Max_city, Min_city} = find_max_min_city(Converted_list),
    print_max_min(Max_city, Min_city).

convert_list_to_c([{Name,{f, F}} | Rest]) ->
    Converted_City = {Name, {c, (F - 32)*5/9}},
    [Converted_City | convert_list_to_c(Rest)];
convert_list_to_c([City | Rest]) ->
    [City | convert_list_to_c(Rest)];
convert_list_to_c([]) ->
    [].

find_max_min_city([City|Rest]) ->
    find_max_min_city(Rest, City, City).

find_max_min_city([{Name, {c, Temp}} | Rest],
		  {Max_Name, {c, Max_Temp}},
		  {Min_Name, {c, Min_Temp}}) ->
    if
	Temp > Max_Temp	-> 
	    Max_City = {Name, {c, Temp}};
	true -> 
	    Max_City = {Max_Name, {c, Max_Temp}}
    end,
    if
	Temp < Min_Temp	-> 
	    Min_City = {Name, {c, Temp}};
	true -> 
	    Min_City = {Min_Name, {c, Min_Temp}}
    end,
    find_max_min_city(Rest, Max_City, Min_City);

find_max_min_city([], Max_City, Min_City) ->
    {Max_City, Min_City}.

print_max_min({Max_Name, {c, Max_Temp}}, {Min_Name, {c, Min_Temp}}) ->
    io:format("Max temperature was ~w c in ~w~n", [Max_Temp, Max_Name]),
    io:format("Min temperature was ~w c in ~w~n", [Min_Temp, Min_Name]).
    


print_temp([{Name, {c, Temp}} | Rest]) ->
    io:format("~-15w ~w c~n", [Name, Temp]),
    print_temp(Rest);
print_temp([]) ->
    ok.
