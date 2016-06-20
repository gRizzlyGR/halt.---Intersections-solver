:- use_module(circolazione).
:- use_module(utils).
:- use_module(precedenze).
:- use_module(gestore_kb).


menu :-
%	writef('%50c', ['-------Menu-------']).
	write('---------Menu---------'), nl,
	write('[1] Inserisci e risolvi incrocio'), nl,
	write('[2] Carica e risolvi un incrocio preesistente'), nl,
	write('[3] Cancella incrocio'), nl,
	write('[4] Visualizza incrocio'), nl,
	write('[5] Genera grafo di precedenze'), nl,
	write('[0] Esci'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(Scelta), nl,
	call(scelta-Scelta).


scelta-1 :-
	read(Incrocio),
	utils:payload(Incrocio, Fatti),
	inserisci_incrocio(Fatti), nl,
	risolvi,
	pausa,
	menu.

% Per il dataset già a disposizione
scelta-2 :-
	write('--Inserisci l\'ID del caso da caricare :'), read(ID),
	test(ID, Incrocio),
	write('--Caso caricato!'), nl,
	write(Incrocio), nl,
	risolvi,
	pausa,
	menu.



scelta-3 :-
	write('--Incrocio in memoria cancellato'),
	cancella_incrocio, nl,
	menu.


scelta-4 :-
	write('--WORK IN PROGRESS'), nl,
	menu.

%scelta-5 :-
%%	working_directory(CWD, CWD),
%	utils:salva_grafo('/home/giuseppe/', 'precede'),
%	menu.
	
%scelta-0 :-
%	halt.

scelta-0 :-
	cancella_incrocio.

start :-
	cancella_incrocio,
	menu.

risolvi :-
	write('--Soluzione:'), nl,
	circolano, nl.

% Mette in pausa per consentire all'utente di visualizzare i risultati
pausa :-
	write('--Premi Invio per continuare...'), get_char(_), get_code(_), nl.

%start :-
%	write('--Opzione non riconosciuta!'), nl, nl,

%	menu.
