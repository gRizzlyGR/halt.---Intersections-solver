:- module(gestore_kb, [
			inserisci_incrocio/1,
			pulisci/0,
			test/2,
			proviene/2,
			transita/3,
			segnaletica/2
			]).

:- ensure_loaded(['db']).
%:- consult(['db']).

:- dynamic proviene/2.
:- dynamic transita/3.
:- dynamic segnaletica/2.

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
	retractall(segnaletica(_, _)).

% Test del dataset già a disposizione
test(ID, Incrocio) :-
	write('------------------Test'), nl,
	incrocio(ID, Incrocio),
	inserisci_incrocio_test(Incrocio).

% I casi nel db sono formati da strutture (compound), quindi atom_to_term/2 non serve
inserisci_incrocio_test([Fatto | AltriFatti]) :-	
	assert(Fatto),
	inserisci_incrocio_test(AltriFatti).

inserisci_incrocio_test([]).
