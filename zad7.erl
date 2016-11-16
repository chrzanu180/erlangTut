-module (zad7).
-export ([main/1, server/0]).

main(Srv) ->
	%Pid = spawn(zad6, server, []),
	
	{_, [X]} = io:fread("Podaj pierwsza liczbe: ", "~d"),
	{_, [Y]} = io:fread("Podaj druga liczbe: ", "~d"),
	{_, [Op]} = io:fread("Podaj dzialanie: ", "~s"),
	{my_shell, Srv} ! {node(), [X,Y,Op]},
	receive
		R ->
			io:format("~p~n", [R])
	end.
	
server() ->
	receive
		{ClNode, [X,Y,Op]} ->
		 
		 case Op of 
			 "+" ->
			 {my_shell, ClNode} ! X+Y;

			 "-" ->
			 {my_shell, ClNode} ! X-Y;

			 "*" ->
			 {my_shell, ClNode} ! X*Y;

			 "/" ->
			 {my_shell, ClNode} ! X/Y
		 end
	end,
	server().