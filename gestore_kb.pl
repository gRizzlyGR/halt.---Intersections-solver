:- module(gestore_kb, [
			inserisci_incrocio/1,
			cancella_incrocio/0,
			test/1,
			proviene/2,
			transita/3,
			segnaletica/2
			]).

:- use_module(db).

:- dynamic proviene/2.
:- dynamic transita/3.
:- dynamic segnaletica/2.

% Solo per l'utilizzo del dataset già a disposizione
:- dynamic incrocio/2.

inserisci_incrocio([Fatto | AltriFatti]) :-	
	assert_fatto(Fatto),
	inserisci_incrocio(AltriFatti).

inserisci_incrocio([]).
	
assert_fatto(Fatto) :-
	atom_to_term(Fatto, T, _),
	assert(T).

cancella_incrocio :-
	retractall(proviene(_, _)),
	retractall(transita(_, _, _)),
	retractall(segnaletica(_, _)).

% Test del dataset già a disposizione
test(ID) :-
%	use_module(db),
	incrocio(ID, Incrocio),
	inserisci_incrocio(Incrocio).

