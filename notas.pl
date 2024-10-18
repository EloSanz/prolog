alumno(juan).
alumno(maria).
alumno(pepe).
nota_parcial1(juan, 4).
nota_parcial1(maria, 2).
nota_parcial1(pepe,7).
nota_parcial1(elo,7).

nota_parcial2(juan, 2).
nota_parcial2(maria, 8).
nota_parcial2(pepe, 4).
nota_parcial2(elo,7).

nota_recuperatorio(pepe, 7).
nota_recuperatorio(juan, 7).
nota_recuperatorio(maria, 4).

%El listado de los alumnos que promocionan la materia, indicando el nombre y la nota
%final (promedio de los dos parciales), para cada uno.






final(Alumno, Estado) :-
    nota_parcial1(Alumno, N1),
    nota_parcial2(Alumno, N2),
    nota_recuperatorio(Alumno, Nrecu),
    min_list([N1, N2], Min),
    (   
        Nrecu > Min ->
        (
            Max is max(N1, N2),
            (   Max =:= N1 -> NuevoParcial2 = Nrecu, NuevoParcial1 = N1;
                NuevoParcial1 = Nrecu, NuevoParcial2 = N2
            )
        );
        NuevoParcial1 = N1,
        NuevoParcial2 = N2
    ),
    (  
        NuevoParcial1 >= 4, NuevoParcial2 >= 4 ->
        (  
            (   NuevoParcial1 < 7 ; NuevoParcial2 < 7 ) -> Estado = 'Aprobado'
            ;%el or acá funciona como else
            Estado = 'Promocionado'
        );%else
        Estado = 'No Aprobado'
    ).

aprobado(Alumno):-
    nota_parcial1(Alumno, N1),
    nota_parcial2(Alumno, N2),
    N1 >= 4 , N2 >= 4.
    
promocionado(Alumno):-
    nota_parcial1(Alumno, N1),
    nota_parcial2(Alumno, N2),
    N1 > 6 , N2 > 6.

    
