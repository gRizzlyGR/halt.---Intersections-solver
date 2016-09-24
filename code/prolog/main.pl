:- use_module(circolazione).
%:- use_module(utils).
:- use_module(precedenze).
:- use_module(gestore_kb).
:- use_module(menu_utente).
:- use_module(menu_admin).


% Lancio il menu utente o il menu da amministratore in base agli argomenti a riga di comando.
% Se l'argomento è nullo o sbagliato, lancio il menu utente.
start :-
	current_prolog_flag(argv, [Args]), 
	atom_concat('menu_', Args, Menu),
	call(Menu).

start :-
	menu_utente.

% Risolvo tutti gli incroci presenti nella KB
test :-
	findall(ID, incrocio(ID, _), IDs),
	soluzione(IDs).
	
soluzione([ID | T]) :-
	writeln(ID),
	pulisci,
	recupera_incrocio(ID, _),
	menu_utente:risolvi,
	soluzione(T).

soluzione([]).
