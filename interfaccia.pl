:- module(interfaccia, [init/0]).

:- use_module(gestore_kb).
:- use_module(utils).

menu :-
%	writef('%50c', ['-------Menu-------']).
	write('---------Menu---------'), nl,
	write('[1] Inserisci incrocio'), nl,
	write('[2] Risolvi incrocio'), nl,
	write('[3] Cancella incrocio'), nl,
	write('[0] Esci'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(Scelta), nl,
	call(scelta-Scelta).


scelta-1 :-
	read(Incrocio),
	utils:payload(Incrocio, Fatti),
	inserisci_incrocio(Fatti), nl,
	menu.

scelta-2 :-
	write('--Soluzione:'), nl,
	solve, nl,
	menu.

scelta-3 :-
	cancella_incrocio, nl,
	menu.
	
%scelta-0 :-
%	halt.

scelta-0.

% Per il dataset già a disposizione
scelta-test :-
	read(ID),
	test(ID).

init :-
	menu.

init :-
	write('--Opzione non riconosciuta!'), nl, nl,
	menu.


