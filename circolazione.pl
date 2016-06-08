:- module(circolazione, [circolano1/0, circolano2/0, ordine/2]).

:- use_module(precedenze).
:- use_module(msg).
:- use_module(utils).
:- use_module(grafo).

circolano1 :-
	write("-----Metodo classico"),nl,
	prima,
	dopo,
	infine.


circolano2 :-
	write("-----Metodo con grafi"),nl,
	grafo_incrocio(Grafo),
	grafo:ordina(Grafo, Ordine),
%	write(Ordine),nl.

	utils:primo_elem(Ordine, Primo),
	msg:primo_a_passare(Primo),

	utils:spuntata(Ordine, Prossimi),
	msg:prossimi_a_passare(Prossimi),

	utils:ultimo_elem(Ordine, Ultimo),
	msg:ultimo_a_passare(Ultimo).

% Ordinamento. Il cut previene il duplicato della lista ordinata quando quella di input è già ordinata di suo
ordine(Lista, Ordinata) :-
	utils:perm(Lista, Ordinata),
	ordinato(Ordinata),
	!.

ordinato([]).
ordinato([_]).
ordinato([X,Y|T]) :-
	precede(X,Y),
	\+ simultanei(X, Y),
%	passa_prima(X, Y),
	ordinato([Y|T]).

ordinato([X,Y|T]) :-
	simultanei(X,Y),
	ordinato([[X,Y]| T]).

ordinato([[X | _], Y| T]) :-
	simultanei(X,Y),
	ordinato([[X,Y|_] | T]).

% Uno o più veicoli passano nello stesso momento
prima :-
	tutti_i_primi(Veicoli),
	msg:prim(Veicoli).


dopo :-
	tutti_i_prossimi(Prossimi),
	prossimi_insieme(PassanoInsieme),

	append(PassanoInsieme, NonSimultanei, Prossimi),
	PassanoInsieme = [H|_],

	append(NonSimultanei, [H], P2),	
	ordine(P2, Ordinata),

	utils:sostituisci(PassanoInsieme, H, Ordinata, P3),
	msg:prossimi_a_passare(P3).


infine :-
	tutti_gli_ultimi(Veicoli),
	msg:ultim(Veicoli).

	
%---Metodo con grafi

% La precedenza è un arco che parte dal veicolo che precede al preceduto. Il tutto può essere rappresentato da un grafo
subgrafo_di_precedenza(Veicolo, SubGrafo) :-
	proviene(Veicolo, _),
	findall(Preceduto, precede(Veicolo, Preceduto), L),
	grafo:crea_grafo(Veicolo, L, SubGrafo).

% Quando tutti i grafi di precedenza di ogni singolo veicolo vengono generati, si possono unire per formare il grafo che
% rappresenta l'incrocio
grafo_incrocio(Grafo) :-
	findall(SubGrafo, subgrafo_di_precedenza(_, SubGrafo), L),
	grafo:unisci_grafi(L, Grafo).
