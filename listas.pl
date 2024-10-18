sumLista([], 0).
sumLista([X | Xs], S):-
	sumLista(Xs, S1),
	S is S1 + X.
	
miLength([], 0).
miLength([ _ | Xs], S):-
	miLength(Xs, S1),
	S is S1 + 1.
	
promedio(Lista, R):-
	sumLista(Lista, S),
	miLength(Lista, N),
	N > 0,
	R is (S / N).



listas_iguales([], []).  % Dos listas vacías son iguales
listas_iguales([H1|T1], [H2|T2]) :-
    H1 == H2,            % Los primeros elementos son iguales
    listas_iguales(T1, T2).  % Recurre para comparar los restos de las listas

misma_longitud([], []).  % Dos listas vacías tienen la misma longitud
misma_longitud([_|T1], [_|T2]) :-
    misma_longitud(T1, T2).  % Recurre para contar los elementos

lista_menor([], []).  % Dos listas vacías son consideradas iguales
lista_menor([H1|T1], [H2|T2]) :-
    H1 < H2,          % El primer elemento de la primera lista es menor
    lista_menor(T1, T2).  % Recurre para comparar los restos de las listas

promedioPromedio(Lista1, Lista2, Promedio):-
	pp_(Lista1, 0, 0, P1),
	pp_(Lista2, 0, 0, P2),
	Promedio is (P1 + P2) / 2.

pp_([], Acum, Cant, Promedio):-
	Cant \= 0,
	Promedio is Acum / Cant.

pp_([X | XS] , Acum, Cant, Promedio):-
 	pp_(XS, Acum + X, Cant + 1, Promedio).

pp([], 0).
pp(Lista, Promedio):- 
	pp_(Lista, 0, 0, Promedio).



verPrimero([Ultimo], Ultimo).
verPrimero([X | _ ], X).

estaOrdenada([]):- true.
estaOrdenada([_]):- true.

estaOrdenada([Primero, Segundo | Xs]):-
	Primero =< Segundo,
	estaOrdenada([Segundo | Xs]).

nota(juan, 7).
nota(mar, 76).
nota(juan, 77).

producto_cartesiano(X,Y):- nota(_, X), nota(_, Y).
seleccion(X,Y):- producto_cartesiano(X,Y), X < Y.
proyeccion(X):- seleccion(X,_).
max_nota(X):- nota(_, X), \+ proyeccion(X).

par(X):- 0 is X mod 2.

%Sumar cuadrados de los Impares

s_c_i([], 0).
s_c_i([X | Xs], R):-
	s_c_i(Xs, R1),
	(\+par(X) -> R is R1 + (X*X); R ).




