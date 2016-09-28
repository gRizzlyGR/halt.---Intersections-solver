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
	utils:ben_formattato(ListaVeicoli, Veicoli),
	format('I veicoli ~w passano insieme;~n', [Veicoli]).

%ultimi_a_passare(Ultimi) :-
%	format('I veicoli ~w sono gli ultimi a passare.~n', [Ultimi]).


%%%%%%%%%%%%%%%%%%%%%%%%
primi_a_passare([veicolo(V)]) :-
	format('Il veicolo ~w è il primo a passare;~n', [V]).

primi_a_passare(ListaPrimi) :-
	piu_di_uno(ListaPrimi),
	utils:ben_formattato(ListaPrimi, Primi),
	format('I veicoli ~w sono i primi a passare;~n', [Primi]).

ultimi_a_passare([veicolo(V)]) :-
	format('Il veicolo ~w è l\'ultimo a passare;~n', [V]).

ultimi_a_passare(ListaUltimi) :-
	piu_di_uno(ListaUltimi),
	utils:ben_formattato(ListaUltimi, Ultimi),
	format('I veicoli ~w sono gli ultimi a passare;~n', [Ultimi]).

prossimi_insieme(ListaVeicoli) :-
	utils:ben_formattato(ListaVeicoli, Veicoli),
	format('I veicoli ~w sono i prossimi a passare insieme;~n', [Veicoli]).

piu_di_uno(Lista) :-
	length(Lista, N),
	N > 1.

% Messaggi per il caso di attesa circolare
va_al_centro(veicolo(V)) :-
	format('Il veicolo ~w si sposta al centro;~n', [V]).

ultimo_dal_centro(veicolo(V)) :-
	format('Il veicolo ~w prosegue per ultimo.~n', [V]).

% Analisi di un veicolo
precedenti(V, []) :-
	format('Il veicolo ~w non è preceduto da nessuno.~n', [V]).

precedenti(V, Lista) :-
	utils:veicoli_atom(Lista, A),
	stampa_precedenti(V, Lista, A).

preceduti(V, []) :-
	format('Il veicolo ~w non precede nessuno.~n', [V]).

preceduti(V, Lista) :-
	utils:veicoli_atom(Lista, A),
	stampa_preceduti(V, Lista, A).
	

simultanei(_, []).

simultanei(V, Lista) :-
	utils:veicoli_atom(Lista, A),
	stampa_simultanei(V, Lista, A).

stampa_precedenti(V, Lista, A) :-
	piu_di_uno(Lista),
	format('Il veicolo ~w è preceduto dai veicoli ~w.~n', [V, A]).

stampa_precedenti(V, [veicolo(_)], A) :-
	format('Il veicolo ~w è preceduto dal veicolo ~w.~n', [V, A]).

stampa_preceduti(V, Lista, A) :-
	piu_di_uno(Lista),
	format('Il veicolo ~w precede i veicoli ~w.~n', [V, A]).

stampa_preceduti(V, [veicolo(_)] , A) :-
	format('Il veicolo ~w precede il veicolo ~w.~n', [V, A]).

stampa_simultanei(V, Lista, A) :-
	piu_di_uno(Lista),
	format('Insieme al veicolo ~w passano i veicoli ~w.~n', [V, A]).

stampa_simultanei(V, [veicolo(_)] , A) :-
	format('Insieme al veicolo ~w passa il veicolo ~w.~n', [V, A]).

non_esiste :-
	writeln('Il veicolo inserito non esiste. Forse non hai caricato alcun incrocio.').
