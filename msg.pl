:- module(msg, []).

va_al_centro(X) :-
	format('Il veicolo ~w va al centro;~n', [veicolo(X)]).

primo_a_passare(X) :-
	format('Il veicolo ~w è il primo a passare;~n', [veicolo(X)]).

prossimo_a_passare(X) :-
	format('Il veicolo ~w è il prossimo a passare;~n', [veicolo(X)]).

ultimo_a_passare(X) :-
	format('Il veicolo ~w è l\'ultimo a passare;~n', [veicolo(X)]).
