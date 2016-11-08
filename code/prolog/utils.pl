:- module(utils, []).

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

% Permutazione di elementi. Una permutazione di una lista vuota è una lista vuota, oppure è una lista che ha come testa
% un elemento della lista e come coda una permutazione degli elementi rimanenti
perm([], []).

perm(L, [H|PermutRimanenti]) :-
	append(V, [H|U], L),
	append(V, U, W),
	perm(W, PermutRimanenti).


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

% Converto una lista di veicoli simultanei in un atomo da stampare in modo ben formattato
ben_formattato(Lista, Atomo) :-
	acc_ben_formattato(Lista, [], Epurata),
	rev(Epurata, Inversa),
	atomic_list_concat(Inversa, ', ', Atomo).

acc_ben_formattato([veicolo(Veicolo) | T], Acc, Epurata) :-
	acc_ben_formattato(T, [Veicolo | Acc], Epurata).

acc_ben_formattato([], A, A).


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

veicoli_atom(Lista, Atomo) :-
	non_vuota(Lista),
	lista_di_atomi(Lista, Atomi),
	atomic_list_concat(Atomi, ', ', Atomo).


% Converto una lista di termini, di solito compound, in una listi di atomi
lista_di_atomi(Lista, Atomi) :-
	acc_lista_di_atomi(Lista, [], Atomi).

acc_lista_di_atomi([veicolo(Term) | T], Acc, Atomi) :-	
	term_to_atom(Term, Atomo),
	acc_lista_di_atomi(T, [Atomo | Acc], Atomi).

acc_lista_di_atomi([], A, A).

non_vuota(Lista) :-
	length(Lista, N),
	N > 0.

non_esiste(Veicolo) :-
	findall(Veicolo, proviene(Veicolo, _), L),
	length(L, N),
	N = 0.
