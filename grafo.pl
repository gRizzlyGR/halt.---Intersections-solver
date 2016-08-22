:- module(grafo, []).

:- use_module(library(lists)).
:- use_module(library(ugraphs)).

unisci_grafi(Lista, Grafo) :-
	acc_unisci_grafi(Lista, [], Grafo).

acc_unisci_grafi([SubGrafo|T], Acc, Grafo) :-
	ugraph_union(SubGrafo, Acc, NGrafo),
	acc_unisci_grafi(T, NGrafo, Grafo).

acc_unisci_grafi([], G, G).


crea_grafo(Nodo, Lista, Grafo) :-
	trova_archi(Nodo, Lista, [], Archi),
	vertices_edges_to_ugraph([], Archi, Grafo).

trova_archi(_, [], A, A).

trova_archi(Nodo, [Vicino|T], Acc, Archi) :-
%	crea_arco(Nodo, H, Arco),
	trova_archi(Nodo, T, [Nodo-Vicino|Acc], Archi).

ordina(Grafo, Ordine) :-
	top_sort(Grafo, Ordine).

disegna(Funtore) :-
	format('digraph ~s {~n', [Funtore]),
	forall(call(Funtore, Da, A), format(' "~w" -> "~w";~n', [Da, A])),
	format('}~n').
%crea_arco(Nodo1, Nodo2, Arco) :-
%	term_to_atom(Nodo1, Atomo1),
%	term_to_atom(Nodo2, Atomo2),
%	Tratt = '-',
%	atom_concat(Tratt, Atomo2, TA),
%	atom_concat(Atomo1, TA, AtomArco),
%	atom_to_term(AtomArco, Arco, _).
