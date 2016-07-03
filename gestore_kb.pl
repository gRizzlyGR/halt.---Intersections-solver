:- module(gestore_kb, [
%			inserisci_incrocio/1,
			pulisci/0,
%			carica/2,
			carica_in_memoria/1,
			recupera_incrocio/2,
			proviene/2,
			transita/3,
			segnaletica/2,
			incrocio/2,
			da_stampare/1,
%			recupera/1,
			stampa_incrocio/1,
			registra_incrocio/1,
			elimina_incrocio/1
			]).

:- ensure_loaded(['kb']).
%:- consult(['db']).

:- dynamic proviene/2.
:- dynamic transita/3.
:- dynamic segnaletica/2.

% Solo per la stampa
%:- dynamic output/1.


% Inserimento solo in memoria
%inserisci_incrocio([Fatto | AltriFatti]) :-	
%	assert_fatto(Fatto),
%	inserisci_incrocio(AltriFatti).

%inserisci_incrocio([]).
%	
%assert_fatto(Fatto) :-
%	atom_to_term(Fatto, T, _),
%	assert(T).

% Rimuove l'eventaule incrocio inserito precedentemente
pulisci :-
	retractall(proviene(_, _)),
	retractall(transita(_, _, _)),
	retractall(segnaletica(_, _)).
%	retractall(output(_)).

% Test del dataset già a disposizione
recupera_incrocio(ID, Incrocio) :-
	incrocio(ID, Incrocio),
	carica_in_memoria(Incrocio).

% I casi nella kb sono formati da strutture (compound), quindi atom_to_term/2 non serve
carica_in_memoria([Fatto | AltriFatti]) :-	
	assert(Fatto),
	carica_in_memoria(AltriFatti).

carica_in_memoria([]).

% Utilizzato solo per la stampa a video
%recupera(Incrocio) :-
%	output(Incrocio).

da_stampare(Incrocio) :-
	assert(output(Incrocio)).

% Stampo l'incrocio in modo ben formattato
stampa_incrocio([proviene(veicolo(Veicolo), braccio(Braccio)) | T]) :-
	format('Il veicolo ~w proviene dal braccio ~w.~n', [Veicolo, Braccio]),
	stampa_incrocio(T).

stampa_incrocio([transita(veicolo(Veicolo), dritto, braccio(Braccio)) | T]) :-
	format('Il veicolo ~w transita nel braccio ~w proseguendo dritto.~n', [Veicolo, Braccio]),
	stampa_incrocio(T).

stampa_incrocio([transita(veicolo(Veicolo), Direzione, braccio(Braccio)) | T]) :-
	Direzione \= dritto,
	format('Il veicolo ~w transita nel braccio ~w svoltando a ~w.~n', [Veicolo, Braccio, Direzione]),
	stampa_incrocio(T).

stampa_incrocio([segnaletica(braccio(Braccio), segnale(Segnale)) | T]) :-
	format('Nel braccio ~w c\'è il segnale ~w.~n', [Braccio, Segnale]),
	stampa_incrocio(T).

stampa_incrocio([]) :- nl.


% Clausole per l'IO
registra_incrocio(Incrocio) :-
	percorso(File),
	tell(File),
	assert(Incrocio),
	listing(incrocio),
	told.


elimina_incrocio(ID) :-
	incrocio(ID, _),
	percorso(File),
	tell(File),
	retract(incrocio(ID, _)),
	listing(incrocio),
	told.


percorso(File) :-
	source_file(incrocio(_, _), File).
