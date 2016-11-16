-module (zad4).
-compile(export_all).

-record(merchandise,{name,price,quantity}).

add(R, L)->
	D=[R1 || R1 <- L, R#merchandise.name==R1#merchandise.name],
case D of
	[] ->
	 [R | L];
	_ ->
	 [RR]=D,
	 Q=RR#merchandise.quantity+R#merchandise.quantity,
	 STemp=L-- D,
	 STemp++ [R#merchandise{quantity=Q}]
	end.

rmv(R, L)->
Q = R#merchandise.quantity *(-1),
if
	Q>0 ->
		R1=R#merchandise{quantity = Q},
		add(R1,L);
	true->
		[N || N <-L, N#merchandise.name/=R#merchandise.name]
	end.
	