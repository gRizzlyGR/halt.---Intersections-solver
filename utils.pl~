:- module(utils, []).

% Una lista vuota è un insieme
set([], []).

% Accantona la testa, rimuovila dalla coda e continua a processare quest'ultima
set([H|T], [H|T1]) :- 
    del(H, T, T2),
    set(T2, T1).

% Ciò che si toglie da una lista vuota produce una lista vuota
del(_, [], []).

% Cancella la testa
del(H, [H|T], T1) :-
	del(H, T, T1).

% Cancella un elemento che non sia la testa
del(X, [H|T], [H|T1]) :-
    X \= H,
    del(X, T, T1).

