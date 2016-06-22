:- use_module(circolazione).
:- use_module(utils).
:- use_module(precedenze).
:- use_module(gestore_kb).
:- use_module(menu_utente).
:- use_module(menu_admin).


%menu :-
%%	writef('%50c', ['-------Menu-------']).
%	write('---------Menu---------'), nl,
%	write('[1] Inserisci e risolvi incrocio'), nl,
%	write('[2] Carica e risolvi un incrocio preesistente'), nl,
%	write('[3] Cancella incrocio'), nl,
%	write('[4] Visualizza incrocio'), nl,
%	write('[5] Genera grafo di precedenze'), nl,
%	write('[0] Esci'), nl, nl,
%	write('--Fai la tua scelta (seguita dal punto): '), read(Scelta), nl,
%	call(scelta-Scelta).


%scelta-1 :-
%	pulisci,
%	read(Incrocio),
%	utils:payload(Incrocio, Fatti),
%	inserisci_incrocio(Fatti), nl,
%	risolvi,
%	pausa,
%	menu.

%% Per il dataset già a disposizione
%scelta-2 :-
%	write('--Inserisci l\'ID del caso da caricare :'), read(ID),
%	test(ID, Incrocio),
%	write('--Caso caricato!'), nl,
%	write(Incrocio), nl,
%	risolvi,
%	pausa,
%	menu.



%scelta-3 :-
%	write('--Incrocio in memoria cancellato'),
%	pulisci, nl,
%	menu.


%scelta-4 :-
%	write('--WORK IN PROGRESS'), nl,
%	menu.

%scelta-5 :-
%%	working_directory(CWD, CWD),
%	utils:salva_grafo('/home/giuseppe/', 'precede'),
%	menu.
	
%scelta-0 :-
%	halt.

%scelta-0 :-
%	pulisci.


% Lancio il menu utente o il menu da amministratore in base agli argomenti a riga di comando.
% Se l'argomento è nullo o sbagliato, lancio il menu utente.
start :-
	current_prolog_flag(argv, [Args]), 
	writeln(Args),
%	pulisci,
	atom_concat('menu_', Args, Menu),
	call(Menu).

start :-
	call(menu_utente).



%start :-
%	write('--Opzione non riconosciuta!'), nl, nl,

%	menu.
