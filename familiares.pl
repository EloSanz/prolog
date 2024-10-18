esMadreDe(mabel,eliseo).
esMadreDe(rosa,mabel).
esMadreDe(rosa,anaMaria).
esMadreDe(anaMaria, agustin).
esMadreDe(rosa,fulanita).

esPadreDe(enrique,eliseo).
esPadreDe(luis,enrique).
esPadreDe(tucho,mabel).
esPadreDe(tucho,anaMaria).

esPadre(enrique).
esPadre(luis).

esMadre(mabel).
esMadre(rosa).

esCiudad(bsas, 10).
esCiudad(roma, 5).
esCiudad(ny, 20).

mayorQue(C1, C2):-
    esCiudad(C1, Poblacion1),
    esCiudad(C2, Poblacion2), C1 \== C2,
    Poblacion1 > Poblacion2.

muchoMayorQue(C1,C2):-
    mayorQue(C1, Medio), mayorQue(Medio,C2).




desciendeDe(Descendiente, Ancestro) :- %caso base
    esProgenitorDe(Ancestro, Descendiente).

desciendeDe(Descendiente, Ancestro) :-
    esProgenitorDe(Ancestro, AncestroMedio),%averiguo si es progenitor de alguno
    desciendeDe(Descendiente, AncestroMedio).%averiguo si ese alguno es Ancestro del Descendiente
   

esHijoDe(Hijo,Progenitor):-
    esProgenitorDe(Progenitor,Hijo).
esHermanoDe(H1,H2):-
    esPadreDe(Padre,H1), esMadreDe(Madre,H1),
    esPadreDe(Padre,H2), esMadreDe(Madre,H2).

esMedioHermanoDe(H1,H2):-
    (esMadreDe(M,H1), esMadreDe(M,H2) , esPadreDe(P,H1), not(esPadreDe(P,H2));
    esPadreDe(P,H1), esPadreDe(P,H2) ,  esMadreDe(M,H1), not(esMadreDe(M,H2))).



esPrimoDe(Primo1,Primo2):-
    esTioDe(Tio, Primo1),
    esProgenitorDe(Tio,Primo2).

esProgenitorDe(Progenitor, Hijo):-
    esPadreDe(Progenitor, Hijo) ; esMadreDe(Progenitor,Hijo).


esTioDe(Tio,Sobrino):-
    esProgenitorDe(Abuelo,Tio), esProgenitorDe(Abuelo, Progenitor),
    esProgenitorDe(Progenitor,Sobrino), Tio \= Progenitor.

esAbueloDe(Abuelo, Nieto):-
    esProgenitorDe(Abuelo, Padre),
    esProgenitorDe(Padre,Nieto).

