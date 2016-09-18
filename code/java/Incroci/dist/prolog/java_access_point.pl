%:- module(java_access_point, [
%				process_list/2,
%				solve_crossroad_by_id/1,
%				solve_new_crossroad/1
%				]).

:- use_module(precedenze).
:- use_module(circolazione).
:- use_module(gestore_kb).
:- use_module(utils).

%process_list([],[]). 
%process_list([H|T], [string(At) | NewT]) :- 
%	term_to_atom(H, At), process_list(T, NewT).


% User operations
solve_new_crossroad(Input) :-
	pulisci,
	utils:payload(Input, Incrocio),
	carica_in_memoria(Incrocio),
	stampa_incrocio(Incrocio),
	circolano.

solve_crossroad_by_id(ID) :-
	pulisci,
	recupera_incrocio(ID, Incrocio),
	stampa_incrocio(Incrocio),
	writeln('--Soluzione'),
	circolano.

% Crossroad not found
solve_crossroad_by_id(_) :-
	writeln("--ATTENZIONE: Incrocio non trovato! Controlla l'ID").

visualize_crossroad(ID) :-
	pulisci,
	recupera_incrocio(ID, Incrocio),
	stampa_incrocio(Incrocio).

% Admin operations
register_new_crossroad(ID, Input) :-
	utils:payload(Input, Fatti),
	registra_incrocio(incrocio(ID, Fatti)),
	writeln("--Incrocio registrato con successo!").

delete_crossroad(ID) :-
	elimina_incrocio(ID),
	writeln("--Incrocio eliminato con successo!").

% Crossroad not found
delete_crossroad(_) :-
	writeln("ATTENZIONE: Incrocio non trovato! Controlla l'ID").
