:- module(menu_admin, [menu_admin/0]).

:- use_module(gestore_kb).
:- use_module(menu_utente).

menu_admin :-
	pulisci,
	write('---------Admin Menu---------'), nl,	
	write('[1] Registra un incrocio.'), nl,
	write('[2] Elimina un incrocio.'), nl,
	write('[3] Vai al menu utente.'), nl,
	write('[0] Esci.'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(S), nl,
	atom_concat('scelta_', S, Scelta),
	call(Scelta).

scelta_1 :-
	write('--Inserisci l\'ID del nuovo caso: '), read(ID), nl,
	write('--Inserisci la lista dei fatti:'), nl, read(Lista),
	registra_incrocio(incrocio(ID, Lista)), nl,
	write('--Incrocio registrato con successo!'), nl, nl,
	menu_admin.

scelta_1 :-
	write('--ID già presente, cambialo!'), nl,
	menu_admin.

scelta_2 :-
	write('--Inserisci l\'ID del caso che vuoi eliminare:'), read(ID),
	elimina_incrocio(ID), nl,
	write('--Incrocio eliminato con successo!'), nl, nl,
	menu_admin.

scelta_2 :-
	write('--Il caso da te richiesto non esiste!'), nl, nl,
	menu_admin.

scelta_3 :-
	menu_utente.

scelta_0.
