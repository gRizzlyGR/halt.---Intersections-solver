:- module(circolazione_con_grafo, [circolano_grafo/0]).

:- use_module(grafo).

circolano_grafo :-
	write("-----Metodo con grafi"),nl,
	grafo_incrocio(Grafo),
	grafo:ordina(Grafo, Ordine),

	utils:primo_elem(Ordine, Primo),
	msg:primo_a_passare(Primo),

	utils:spuntata(Ordine, Prossimi),
	msg:prossimi_a_passare(Prossimi),

	utils:ultimo_elem(Ordine, Ultimo),
	msg:ultimo_a_passare(Ultimo).

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
