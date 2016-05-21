:- module(msg, []).

va_al_centro(V) :-
	format('Il veicolo ~w va al centro;~n', [V]).

primo_a_passare(V) :-
	format('Il veicolo ~w è il primo a passare;~n', [V]).

prossimo_a_passare(V) :-
	format('Il veicolo ~w è il prossimo a passare;~n', [V]).

ultimo_a_passare(V) :-
	format('Il veicolo ~w è l\'ultimo a passare;~n', [V]).

primi_a_passare(Primi) :-
	format('I veicoli ~w sono i primi a passare;~n', [Primi]).

passano_insieme(Veicoli) :-
	format('I veicoli ~w passano insieme;~n', [Veicoli]).
