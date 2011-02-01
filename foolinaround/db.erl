-module(db).
-compile(export_all).

new() ->
    [].

write(Key, Element, Db) ->
    [{Key, Element}| Db].

read(_, []) ->
    {error, instance};
read(Key, [{Key, Element} | _]) ->
    {ok, Element};
read(Key, [_|T]) ->
    read(Key, T).

match(_,[]) ->
    [];
match(Element,[{Key, Element} | T]) ->
    [Key | match(Element, T)];
match(Element,[_ | T]) ->
    match(Element,T).

delete(Key, []) ->
    {Key, not_in_db};
delete(Key, [{Key, _} | T]) ->
    T;
delete(Key, [H|T]) ->
    [H|delete(Key, T)].
