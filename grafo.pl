:- module(grafo, []).

:- use_module(library(lists)).
:- use_module(library(ugraphs)).


unisci_grafi(Lista, Grafo) :-
	unisci_grafi_acc(Lista, _, Grafo).

unisci_grafi_acc([], Grafo, Grafo).
	
unisci_grafi_acc([H|T], Acc, Grafo) :-
	ugraph_union(H, Acc, NGrafo),
	unisci_grafi_acc(T, NGrafo, Grafo).

crea_grafo(Nodo, Lista, Grafo) :-
	trova_archi(Nodo, Lista, [], Archi),
	vertices_edges_to_ugraph([], Archi, Grafo).

trova_archi(_, [], A, A).

trova_archi(Nodo, [H|T], Acc, Archi) :-
	crea_arco(Nodo, H, Arco),
	trova_archi(Nodo, T, [Arco|Acc], Archi).

crea_grafo(Nodo, [H|T], Archi, Grafo) :-
	crea_arco(Nodo, H, Arco),
	crea_grafo(Nodo, T, [Arco|Archi], Grafo).

crea_arco(Nodo1, Nodo2, Arco) :-
	term_to_atom(Nodo1, Atomo1),
	term_to_atom(Nodo2, Atomo2),
	Tratt = '-',
	atom_concat(Tratt, Atomo2, TA),
	atom_concat(Atomo1, TA, AtomArco),
	atom_to_term(AtomArco, Arco, _).
