esMultiplo(X,Y):- 0 is X mod Y.
esMenor(Desde,Hasta):- Desde < Hasta.

m(F, D, H, R):-
    esMenor(D, H),
    esMultiplo(D, F),
    D_siguiente is D + 1,
    m(F,D_siguiente, H , R_CERO),
    R is R_CERO + 1.

m(F, D, H, R):-
    esMenor(D, H),
    \+ esMultiplo(D, F),
    D_siguiente is D + 1,
    m(F,D_siguiente, H, R).

m(_,D,H,R):-
    \+ esMenor(D, H),
    R is 0.


%version 2

%caso base
multiplos_de_entre(_, Desde, Hasta, 0) :- Desde >= Hasta, !.

multiplos_de_entre(Factor, Desde, Hasta, Q) :-
    esMenor(Desde, Hasta),
    ( 
        esMultiplo(Desde, Factor) ->  
        Q is Q_restante + 1  % Si Desde es múltiplo de Factor, incrementa el contador
        ;   Q is Q_restante      % Si no, no incrementa el contador
    ),
    Desde_siguiente is Desde + 1,  % Pasa al siguiente número
    multiplos_de_entre(Factor, Desde_siguiente, Hasta, Q_restante).  % Llamada recursiva
