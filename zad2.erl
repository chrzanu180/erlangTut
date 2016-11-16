-module (zad2).
-export ([main/0]).


readNumb()->
	{_, [Numb]} = io:fread("Podaj liczbe calkowita:", "~d"),
	Numb.

main() ->
	check42(readNumb()).
	
check42(42)->	
	io:fwrite("OK ~n");
check42(_)->
	io:fwrite("NOK :( ~n"),
	check42(readNumb()).