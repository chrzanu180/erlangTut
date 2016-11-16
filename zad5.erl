-module (zad5).
-compile(export_all).



int_2_bcd(Q)->
	Qlist=integer_to_list(Q),
	Lista = [X - 48 || X <- Qlist],
	Z = << <<Y:4>> || Y <-Lista >>,
	Z.
	
bcd_2_int(Q)->
	Y = [N+48 || <<N:4>> <= Q],
	Ylist=list_to_integer(Y),
	Ylist.
	