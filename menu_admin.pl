:- module(menu_admin, [menu_admin/0]).

menu_admin :-
	write('---------Admin Menu---------'), nl,	
	write('[1] Registra un incrocio'), nl,
	write('[2] Modifica un incrocio'), nl,
	write('[3] Elimina un incrocio'), nl,
	write('[0] Esci'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(S), nl,
	atom_concat('scelta_', S, Scelta),
	call(Scelta).

scelta_1 :-
	write('Inserisci i fatti separati da ";"'), nl.

scelta_2.

scelta_3.

scelta_0.
