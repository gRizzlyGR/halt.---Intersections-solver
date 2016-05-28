:- module(circolazione, [circolano1/0, circolano2/0]).

:- use_module(precedenze).
:- use_module(msg).
:- use_module(utils).
:- use_module(grafo).

circolano1 :-
	write("-----Metodo classico"),nl,
	primo(Primo),
	msg:primo_a_passare(Primo),

	setof(Prossimo, prossimo(Prossimo), P),
	ordine(P, Prossimi),
	msg:prossimi_a_passare(Prossimi),
	ultimo(Ultimo),
	msg:ultimo_a_passare(Ultimo).


circolano2 :-
	write("-----Metodo con grafi"),nl,
	grafo_direzionato(Grafo),
	grafo:ordina(Grafo, Ordine),
%	write(Ordine),nl.

	utils:primo_elem(Ordine, Primo),
	msg:primo_a_passare(Primo),

	utils:spuntata(Ordine, Prossimi),
	msg:prossimi_a_passare(Prossimi),

	utils:ultimo_elem(Ordine, Ultimo),
	msg:ultimo_a_passare(Ultimo).

% Metodo classico
ordine(Lista, Ordinata) :-
	utils:perm(Lista, Ordinata),
	ordinato(Ordinata).

ordinato([]).
ordinato([_]).
ordinato([X,Y|T]) :-
%	precede(X,Y),
	passa_prima(X, Y),
	ordinato([Y|T]).

% Metodo con grafi

% Genera il sottografo del veicolo che rappresenta le relazioni di precedenza
subgrafo_di_precedenza(Veicolo, SubGrafo) :-
	proviene(Veicolo, _),
	findall(Preceduto, precede(Veicolo, Preceduto), L), grafo:crea_grafo(Veicolo, L, SubGrafo).

% Genera il grafo completo dell'incrocio
grafo_direzionato(Grafo) :-
	findall(SubGrafo, subgrafo_di_precedenza(_, SubGrafo), L),
	grafo:unisci_grafi(L, Grafo).