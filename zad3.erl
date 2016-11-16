-module (zad3).
-export ([main/0]).

ileRazy()->
	{_, [Ile]} = io:fread("Ile wyrazow chcesz sprawdzic: ", "~d"),
	Ile.

readTxt()->
	{_, [Txt]} = io:fread("Podaj tekst do sprawdzenia: ", "~s"),
	Txt.

main()->
	powtorz(ileRazy()).
	
powtorz(Ile) when Ile == 0 -> io:fwrite("Koniec! ~n");
powtorz(Ile) when Ile > 0 -> palindrom(readTxt()), powtorz(Ile-1).


palindrom(Txt) ->
	OdwrTxt = lists:reverse(Txt),
	if
		Txt == OdwrTxt ->
		io:fwrite("Tekst to palindrom ~n");
	true ->
		io:fwrite("To nie jest palindrom ~n")
	end.