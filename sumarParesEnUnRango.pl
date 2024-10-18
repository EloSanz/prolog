esPar(X):- 0 is X mod 2.
esMenor(X, Y):- X =< Y.

sumarPares(D,H, 0):- D > H , !.

sumarPares(Desde, Ultimo, Q):-
    esMenor(Desde, Ultimo),
    esPar(Desde),
    Desde_mas_uno is Desde + 1,
    sumarPares(Desde_mas_uno, Ultimo, Q_VALE_CERO),
    Q is Q_VALE_CERO + Desde.


sumarPares(Desde, Ultimo, Q):-
    esMenor(Desde, Ultimo),
    \+ esPar(Desde),
    Desde_mas_uno is Desde + 1,
    sumarPares(Desde_mas_uno, Ultimo, Q).