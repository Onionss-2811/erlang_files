%% @author tukna
%% @doc @todo Add description to demo.


-module(demo).

%% ====================================================================
%% API functions
%% ====================================================================
-export([writing/2, reading/1, clone_file/1]).



%% ====================================================================
%% Internal functions
%% ====================================================================


reading(Name_file) -> 
	file:consult(Name_file).

writing(Name_file, Content_file) ->
	{ok, S} = file:open(Name_file, write),
	lists:foreach(fun(X) -> io:format(S, "~p. ~n", [X]) end, Content_file),
file:close(S).

clone_file(Name_file) ->
	Tuple_content = reading(Name_file),
	Content = lists:nth(2, tuple_to_list(Tuple_content)),
	writing("clone_file", Content).