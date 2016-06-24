:- module(gestore_kb, [
			inserisci_incrocio/1,
			pulisci/0,
			test/2,
			proviene/2,
			transita/3,
			segnaletica/2,
			da_stampare/1,
			recupera/1,
			stampa_incrocio/1
			]).

:- ensure_loaded(['kb']).
%:- consult(['db']).

:- dynamic proviene/2.
:- dynamic transita/3.
:- dynamic segnaletica/2.

% Solo per la stampa
:- dynamic output/1.

% Solo per l'utilizzo del dataset già a disposizione
%:- dynamic incrocio/2.

inserisci_incrocio([Fatto | AltriFatti]) :-	
	assert_fatto(Fatto),
	inserisci_incrocio(AltriFatti).

inserisci_incrocio([]).
	
assert_fatto(Fatto) :-
	atom_to_term(Fatto, T, _),
	assert(T).

% Rimuove l'eventaule incrocio inserito precedentemente
pulisci :-
	retractall(proviene(_, _)),
	retractall(transita(_, _, _)),
	retractall(segnaletica(_, _)),
	retractall(output(_, _)).

% Test del dataset già a disposizione
test(ID, Incrocio) :-
	incrocio(ID, Incrocio),
	inserisci_incrocio_test(Incrocio).

% I casi nella kb sono formati da strutture (compound), quindi atom_to_term/2 non serve
inserisci_incrocio_test([Fatto | AltriFatti]) :-	
	assert(Fatto),
	inserisci_incrocio_test(AltriFatti).

inserisci_incrocio_test([]).

% Utilizzato solo per la stampa in caso di inserimento interattivo dell'utente
recupera(Incrocio) :-
	output(Incrocio).

da_stampare(Incrocio) :-
	assert(output(Incrocio)).

% Stampo l'incrocio in modo ben formattato
stampa_incrocio([proviene(Veicolo, Braccio) | T]) :-
	format('Il veicolo ~w proviene da ~w.~n', [Veicolo, Braccio]),
	stampa_incrocio(T).

stampa_incrocio([transita(Veicolo, dritto, Braccio) | T]) :-
	format('Il veicolo ~w transita in ~w, proseguendo dritto.~n', [Veicolo, Braccio]),
	stampa_incrocio(T).

stampa_incrocio([transita(Veicolo, Direzione, Braccio) | T]) :-
	Direzione \= dritto,
	format('Il veicolo ~w transita in ~w, svoltando a ~w.~n', [Veicolo, Braccio, Direzione]),
	stampa_incrocio(T).

stampa_incrocio([segnaletica(Braccio, Segnale) | T]) :-
	format('Nel ~w c\'è il ~w.~n', [Braccio, Segnale]),
	stampa_incrocio(T).

stampa_incrocio([]) :- nl.
