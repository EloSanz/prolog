alumno(a).
alumno(b).
alumno(c).
alumno(d).
alumno(e).
alumno(f).
alumno(g).
alumno(h).
alumno(i).


parcial1(a, 1).
parcial1(b, 2).
parcial1(c, 3).
parcial1(d, 4).
parcial1(e, 5).
parcial1(f, 6).

parcial2(a, 4).
parcial2(b, 5).
parcial2(c, 6).
parcial2(g, 7).
parcial2(h, 8).
parcial2(i, 9).

nota(a, 1).
nota(b, 3).
nota(c, 2).
nota(d, 4).
nota(e, 8).
nota(f, 6).

producto_cartesianoNotas(X, Y):-
        nota(_, X), 
        nota(_, Y).

seleccionNotas(X, Y):-
    producto_cartesianoNotas(X, Y), X < Y. 

proyeccion(X):- 
    seleccionNotas(X,_).

maxNota1(X):-
    nota(_,X),
    \+ proyeccion(X).

seleccion2(X,Y):-
    proyeccion(X),
    proyeccion(Y),
    X<Y.

proyeccion2(X):-
    seleccion2(X,_).

maxNota2(X):-
    nota(_,X),
    \+ proyeccion2(X).

maxAluNota(Alu,X):-
    nota(Alu,X),
    \+ todosMenosMaximo(X).

    contarMultiplosDeFactor(_, Desde, Hasta, 0) :-
        Desde > Hasta, !. % Cuando Desde es mayor que Hasta, no hay múltiplos, así que la cantidad es 0.
    
    contarMultiplosDeFactor(Factor, Desde, Hasta, Q) :-
        Desde =< Hasta,
        Modulo is Desde mod Factor, % Calcula el residuo de dividir Desde por Factor
        (Modulo =:= 0 -> % Si el residuo es 0, entonces Desde es un múltiplo de Factor
            NuevaQ is Q + 1, % Incrementa la cantidad de múltiplos en 1
            NuevoDesde is Desde + 1, % Incrementa Desde para pasar al siguiente número en el rango
            contarMultiplosDeFactor(Factor, NuevoDesde, Hasta, NuevaQ) % Llamada recursiva con el siguiente número en el rango
        ;
            NuevoDesde is Desde + 1, % Si no es un múltiplo, simplemente pasamos al siguiente número en el rango
            contarMultiplosDeFactor(Factor, NuevoDesde, Hasta, Q) % Llamada recursiva sin incrementar la cantidad de múltiplos
        ).
    

    contar_elementos([],0).
    contar_elementos([_|Cola], Cant):-
            contar_elementos(Cola, X), Cant is X + 1.

    sumar_en_lista([],0).
    sumar_en_lista([X|Y], Total):-
    sumar_en_lista(Y,C), Total is C + X.


    esMulTiploDe(X,Y):-
        0 is X mod Y.
        
    contar_multiplos([], _, 0).
        
    contar_multiplos([Cabeza|Cola],M,Total):-
        esMulTiploDe(Cabeza,M),
        contar_multiplos(Cola,M,X),
        Total is X + 1.

    contar_multiplos([_|Cola], M,Total):-
        contar_multiplos(Cola,M,Total).


    cm([Cabeza|Cola],M,Total):-
        esMulTiploDe(Cabeza,M)->
            (   cm(Cola,M,X),
                Total is X + 1);
            cm(Cola,M,Total).


    misma_cantidad([],[]).
    misma_cantidad(L1,L2):-
        contar_elementos(L1,X), contar_elementos(L2,Y) , X =:= Y.

    misma_suma(X,Y):-
        sumar_en_lista(X,A),sumar_en_lista(Y,B), A=:=B.


    alumnos_solo_parcial1(X):-
        parcial1(X, _),       % Conjunto de alumnos que rindieron parcial1
        \+parcial2(X, _).     % MENOS conjunto de alumnos que rindieron parcial2
    
    alumnos_solo_parcial2(X):-
        parcial2(X, _),
        \+parcial1(X, _).
    
    alumnos_ambos_parciales(X):-
        parcial1(X, _), parcial2(X, _).
    
    alumnos_unidos(X):-
        parcial1(X, _);
        parcial2(X, _).
    

    alumnos(X):-
        parcial1(X,_) ; parcial2(X,_),\+ parcial1(X,_), parcial2(X,_) .

    productoCartesiano(X,Y):-
        alumno(X), alumno(Y).
    combinacionesPosibles(X,Y):- %SIN REPETIDOS
        productoCartesiano(X,Y) , X \== Y.

    pais_superficie(argentina, 2780400).
    pais_superficie(bolivia, 1098581).
    pais_superficie(brasil, 8515767).
    pais_superficie(chile, 756102).
    pais_superficie(colombia, 1141748).
    pais_superficie(ecuador, 256370).
    pais_superficie(guyana, 214969).
    pais_superficie(paraguay, 406752).
    pais_superficie(peru, 1285216).
    pais_superficie(suriname, 163820).
    pais_superficie(uruguay, 176220).
    pais_superficie(venezuela, 916445).
    
    % Regla para encontrar el país de mayor superficie

    productoCartesianoSup(X,Y):-
        pais_superficie(_,X),pais_superficie(_,Y).
    
    seleccionSup(X,Y):-
        productoCartesianoSup(X,Y) , X < Y.

    proyeccionSup(X):-
        seleccionSup(X,_).

    seleccionSup2(X,Y):-
        proyeccionSup(X),
        proyeccionSup(Y),
        X<Y.

    proyeccionSup2(X):-
        seleccionSup2(X,_).

pais_mas_grande(Pais1) :-
    pais_superficie(Pais1, Superficie1),
    \+ proyeccionSup(Superficie1).



pais_m2(P1,P2):-
    pais_superficie(P1, Sup1),
    \+ proyeccionSup(Sup1),
    pais_superficie(P2,Sup2),
    \+ proyeccionSup2(Sup2).
