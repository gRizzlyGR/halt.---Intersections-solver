:- module(msg, []).

va_al_centro(veicolo(V)) :-
	format('Il veicolo ~w si sposta al centro;~n', [V]).

primo_a_passare(veicolo(V)) :-
	format('Il veicolo ~w è il primo a passare;~n', [V]).

prossimi_a_passare([V|T]) :-
	prossimo_a_passare(V),
	prossimi_a_passare(T).

prossimi_a_passare([]).

prossimo_a_passare(Simultanei) :-
	is_list(Simultanei),
	passano_insieme(Simultanei).

prossimo_a_passare(veicolo(V)) :-
	\+ is_list(V),
	format('Il veicolo ~w è il prossimo a passare;~n', [V]).


ultimo_a_passare(veicolo(V)) :-
	format('Il veicolo ~w è l\'ultimo a passare.~n', [V]).

% Più veicoli contemporaneamente
%primi_a_passare(Primi) :-
%	format('I veicoli ~w sono i primi a passare;~n', [Primi]).

passano_insieme(Veicoli) :-
	format('I veicoli ~w passano insieme;~n', [Veicoli]).

%ultimi_a_passare(Ultimi) :-
%	format('I veicoli ~w sono gli ultimi a passare.~n', [Ultimi]).


%%%%%%%%%%%%%%%%%%%%%%%%
primi_a_passare([veicolo(V)]) :-
	format('Il veicolo ~w è il primo a passare;~n', [V]).

primi_a_passare(Primi) :-
	piu_di_uno(Primi),
	format('I veicoli ~w sono i primi a passare;~n', [Primi]).

ultimi_a_passare([veicolo(V)]) :-
	format('Il veicolo ~w è l\'ultimo a passare;~n', [V]).

ultimi_a_passare(Ultimi) :-
	piu_di_uno(Ultimi),
	format('I veicoli ~w sono gli ultimi a passare;~n', [Ultimi]).

prossimi_insieme(Veicoli) :-
	format('I veicoli ~w sono i prossimi a passare insieme;~n', [Veicoli]).

piu_di_uno(Lista) :-
	length(Lista, N),
	N > 1.

%%%%%%%%%%%%%%%%%%%%%%%5
ultimo_dal_centro(veicolo(V)) :-
	format('Il veicolo ~w prosegue per ultimo.~n', [V]).
