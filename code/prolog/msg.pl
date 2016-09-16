:- module(msg, []).

:- use_module(utils).

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

passano_insieme(ListaVeicoli) :-
	ben_formattato(ListaVeicoli, Veicoli),
	format('I veicoli ~w passano insieme;~n', [Veicoli]).

%ultimi_a_passare(Ultimi) :-
%	format('I veicoli ~w sono gli ultimi a passare.~n', [Ultimi]).


%%%%%%%%%%%%%%%%%%%%%%%%
primi_a_passare([veicolo(V)]) :-
	format('Il veicolo ~w è il primo a passare;~n', [V]).

primi_a_passare(ListaPrimi) :-
	piu_di_uno(ListaPrimi),
	ben_formattato(ListaPrimi, Primi),
	format('I veicoli ~w sono i primi a passare;~n', [Primi]).

ultimi_a_passare([veicolo(V)]) :-
	format('Il veicolo ~w è l\'ultimo a passare;~n', [V]).

ultimi_a_passare(ListaUltimi) :-
	piu_di_uno(ListaUltimi),
	ben_formattato(ListaUltimi, Ultimi),
	format('I veicoli ~w sono gli ultimi a passare;~n', [Ultimi]).

prossimi_insieme(ListaVeicoli) :-
	ben_formattato(ListaVeicoli, Veicoli),
	format('I veicoli ~w sono i prossimi a passare insieme;~n', [Veicoli]).

piu_di_uno(Lista) :-
	length(Lista, N),
	N > 1.

% Converto una lista di veicoli simultanei in un atomo da stampare in modo ben formattato
ben_formattato(Lista, Atomo) :-
	acc_ben_formattato(Lista, [], Epurata),
	utils:rev(Epurata, Inversa),
	atomic_list_concat(Inversa, ', ', Atomo).

acc_ben_formattato([veicolo(Veicolo) | T], Acc, Epurata) :-
	acc_ben_formattato(T, [Veicolo | Acc], Epurata).

acc_ben_formattato([], A, A).
	

% Messaggi per il caso di attesa circolare
va_al_centro(veicolo(V)) :-
	format('Il veicolo ~w si sposta al centro;~n', [V]).

ultimo_dal_centro(veicolo(V)) :-
	format('Il veicolo ~w prosegue per ultimo.~n', [V]).
