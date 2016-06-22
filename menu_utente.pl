:- module(menu_utente, [menu_utente/0]).

:- use_module(circolazione).
:- use_module(utils).
:- use_module(precedenze).
:- use_module(gestore_kb).

menu_utente :-
%	writef('%50c', ['-------Menu-------']).
	write('---------Menu---------'), nl,
	write('[1] Inserisci e risolvi incrocio'), nl,
	write('[2] Carica e risolvi un incrocio preesistente'), nl,
	write('[3] Visualizza incrocio'), nl,
%	write('[4] Genera grafo di precedenze'), nl,
	write('[0] Esci'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(S), nl,
	atom_concat('scelta_', S, Scelta),
	call(Scelta).


scelta_1 :-
	pulisci,
	read(Incrocio),
	utils:payload(Incrocio, Fatti),
	inserisci_incrocio(Fatti), nl,
	risolvi,
	pausa,
	menu_utente.

% Per il dataset già a disposizione
scelta_2 :-
	write('--Inserisci l\'ID del caso da caricare :'), read(ID),
	test(ID, Incrocio),
	write('--Caso caricato!'), nl,
	write(Incrocio), nl,
	risolvi,
	pausa,
	menu_utente.



%scelta_3 :-
%	write('--Incrocio in memoria cancellato'),
%	pulisci, nl,
%	menu.


scelta_3 :-
	write('--WORK IN PROGRESS'), nl,
	menu_utente.

%scelta_4 :-
%%	working_directory(CWD, CWD),
%	utils:salva_grafo('/home/giuseppe/', 'precede'),
%	menu.
	
%scelta-0 :-
%	halt.

scelta_0 :-
	pulisci.

% Mette in pausa per consentire all'utente di visualizzare i risultati
pausa :-
	write('--Premi Invio per continuare...'), get_char(_), get_code(_), nl.


risolvi :-
	write('--Soluzione:'), nl,
	circolano, nl.
