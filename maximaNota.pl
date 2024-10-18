nota(a, 1).
nota(b, 3).
nota(c, 2).
nota(d, 4).
nota(e, 8).
nota(f, 6).


productoCartesiano(X,Y):-
nota(_,X),nota(_,Y).

seleccion(X,Y):-
    productoCartesiano(X,Y), X < Y.

proyeccion(X):-
    seleccion(X,_).

maxNota(X):-
    nota(_,X), \+ proyeccion(X).


    multiplos_de_entre(F, D, H, Resultado) :-
        multiplos_de_entre_aux(F, D, H, 0, Resultado).
    
    multiplos_de_entre_aux(_, D, H, Acumulador, Acumulador) :-
        D > H.  % Si D es mayor que H, terminamos y el resultado está en el acumulador.
    multiplos_de_entre_aux(F, D, H, Acumulador, Resultado) :-
        D =< H,  % Todavía estamos dentro del rango.
        0 is D mod F,  % Verificamos si D es múltiplo de F.
        NuevoAcumulador is Acumulador + 1,  % Incrementamos el acumulador.
        SiguienteD is D + 1,  % Pasamos al siguiente número.
        multiplos_de_entre_aux(F, SiguienteD, H, NuevoAcumulador, Resultado).
    multiplos_de_entre_aux(F, D, H, Acumulador, Resultado) :-
        D =< H,  % Todavía estamos dentro del rango.
        D1 is D + 1,  % Pasamos al siguiente número.
        multiplos_de_entre_aux(F, D1, H, Acumulador, Resultado).  % Seguimos sin incrementar el acumulador.

es_mayor_de_edad(Edad) :-
    (Edad >= 18 ->
        write('Es mayor de edad');
    write('Es menor de edad')
    ).
