:- use_module(circolazione).
:- use_module(utils).
:- use_module(precedenze).
:- use_module(gestore_kb).
:- use_module(menu_utente).
:- use_module(menu_admin).


% Lancio il menu utente o il menu da amministratore in base agli argomenti a riga di comando.
% Se l'argomento è nullo o sbagliato, lancio il menu utente.
start :-
	current_prolog_flag(argv, [Args]), 
%	writeln(Args),
%	pulisci,
	atom_concat('menu_', Args, Menu),
	call(Menu).

start :-
	menu_utente.

%test :-
%	findall(ID, gestore_kb:incrocio(ID, _), IDs),
%	solve(IDs).
%	
%solve([ID | T]) :-
%	writeln(ID),
%	pulisci,
%	test(ID, _),
%	menu_utente:risolvi,
%	solve(T).

%solve([]).

%start :-
%	write('--Opzione non riconosciuta!'), nl, nl,

%	menu.
