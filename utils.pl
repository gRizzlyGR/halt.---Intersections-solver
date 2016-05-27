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

% Permutazione di elementi
perm([], []).

perm(L, [H|T]) :-
	append(V, [H|U], L),
	append(V, U, W),
	perm(W, T).


% Primo elemento
primo_elem([Primo|_], Primo).

% Ultimo elemento
ultimo_elem(Lista, Ultimo) :-
	rev(Lista, [Ultimo|_]).

spuntata([_|T], Spuntata) :-
	rev(T, [_|Tmp]),
	rev(Tmp, Spuntata).
	

% Inverso di una lista
rev(Lista, Inversa) :-
	acc_rev(Lista, [], Inversa).

acc_rev([H|T], Acc, R) :-
	acc_rev(T, [H|Acc], R).

acc_rev([], A, A).


	
