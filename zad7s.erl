-module (zad7s).
-export ([main/0).

main() ->
	Pid = spawn(zad6, server, []),
	
	{_, [X]} = io:fread("Podaj pierwsza liczbe: ", "~d"),
	{_, [Y]} = io:fread("Podaj druga liczbe: ", "~d"),
	{_, [Op]} = io:fread("Podaj dzialanie: ", "~s"),
	Pid ! {self(), [X,Y,Op]},
	
	receive
		R ->
			io:format("~p~n", [R])
	end.
	
server() ->
	receive
		{Pid, [X,Y,Op]} ->
		% X = lists:nth(1, InList),
		% Y = lists:nth(2, InList),
		%Op = lists:nth(3, InList),
		 
		 case Op of 
			 "+" ->
			  Pid ! X+Y;
			 "-" ->
			  Pid ! X-Y;
			 "*" ->
			  Pid ! X*Y;
			 "/" ->
			  Pid ! X/Y
		 end
	end.