% Predicado para calcular el promedio de una lista
promedios(Lista, Promedio) :-
    sum_and_count(Lista, Suma, Cuenta),   % Llama al predicado auxiliar para calcular la suma y la cuenta
    Cuenta \= 0,                          % Asegura que la cuenta no sea cero para evitar división por cero
    Promedio is Suma / Cuenta.            % Calcula el promedio

% Predicado auxiliar para calcular la suma y la cantidad de elementos de una lista
sum_and_count([], 0, 0).                  % Caso base: la suma y la cuenta de una lista vacía son 0
sum_and_count([Cabeza|Cola], Suma, Cuenta) :-
    sum_and_count(Cola, SumaCola, CuentaCola),  % Llama recursivamente al predicado auxiliar para la cola de la lista
    Suma is Cabeza + SumaCola,                  % Calcula la suma sumando la cabeza al resultado de la cola
    Cuenta is CuentaCola + 1.                   % Incrementa la cuenta en 1

% Ejemplo de uso:
% ?- promedios([1, 2, 3, 4, 5], Promedio).
% Promedio = 3.0.
