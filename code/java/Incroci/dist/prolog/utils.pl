:- module(utils, []).

:- use_module(library(unix)).
;- use_module(library(process)).

% Una lista vuota è un insieme
set([], []).

% Accantona la testa, rimuovila dalla coda e continua a processare quest'ultima
set([H|T], [H|T1]) :- 
    canc(H, T, T2),
    set(T2, T1).

% Ciò che si toglie da una lista vuota produce una lista vuota
canc(_, [], []).

% Cancella la testa
canc(H, [H|T], T1) :-
	canc(H, T, T1).

% Cancella un elemento che non sia la testa
canc(X, [H|T], [H|T1]) :-
    X \= H,
    canc(X, T, T1).

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

% Sostituisci un elemento nella lista
sostituisci(Nuovo, DaSostituire, [DaSostituire | T], [Nuovo | T]).

sostituisci(Nuovo, DaSostituire, [H|T], [H|T2]) :-
	sostituisci(Nuovo, DaSostituire, T, T2).

% Converte il contenuto ottenuto da uno stream in un lista di termini.
payload(V, R) :-
	term_to_atom(V, A),
	atomic_list_concat(L, ';', A),
	lista_di_termini(L, T),
	rev(T, R).

lista_di_termini(L, T) :-
	acc_lista_di_termini(L, [], T).

acc_lista_di_termini([Atomo | T], Acc, Termini) :-
	atom(Atomo),
	term_to_atom(Term, Atomo),
	acc_lista_di_termini(T, [Term | Acc], Termini).

acc_lista_di_termini([], A, A).
