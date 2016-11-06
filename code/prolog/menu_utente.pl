:- module(menu_utente, [menu_utente/0]).

:- use_module(circolazione).
%:- use_module(utils).
:- use_module(precedenze).
:- use_module(analisi).
:- use_module(gestore_kb).

menu_utente :-
	pulisci,
	write('---------Menu---------'), nl,
	write('[1] Inserisci e risolvi incrocio al volo.'), nl,
	write('[2] Carica e risolvi un incrocio preesistente.'), nl,
	write('[0] Esci.'), nl, nl,
	write('--Fai la tua scelta (seguita dal punto): '), read(S), nl,
%	atom_concat('scelta_', S, Scelta),
%	call(Scelta).
	scelta(S).


scelta(1) :-
	write('--Inserisci i fatti separati da "," e circondati da parentesi quadre:'), nl,
	read(Incrocio),
	carica_in_memoria(Incrocio), nl,
	stampa_incrocio(Incrocio),
	risolvi,
	dettaglio,
	pausa,
	menu_utente.

% Per il dataset già a disposizione
scelta(2) :-
	write('--Inserisci l\'ID del caso da caricare: '), read(ID), nl,
	recupera_incrocio(ID, Incrocio),
	write('--Caso caricato!'), nl,
	stampa_incrocio(Incrocio),
	risolvi,
	dettaglio,
	menu_utente.

scelta(2) :-
	write('--Il caso da te richiesto non esiste! Ricontrolla l\'ID.'), nl, nl,
	menu_utente.
	
scelta(0).


scelta(_) :-
	scelta_non_riconosciuta,
	menu_utente.

% Mette in pausa per consentire all'utente di visualizzare i risultati
pausa :-
	write('--Premi [INVIO] per continuare...'), get_char(_), get_code(_), nl.


risolvi :-
	write('--Soluzione:'), nl,
	circolano, nl.

dettaglio :-
	write('--Vuoi avere più informazioni sui veicoli? (s/n): '), read(S), nl,
	risposta(S), nl.

risposta(s) :-
	write('--Un veicolo in particolare o tutti? (v/t): '), read(S), nl,
	informazioni(S),
	pausa.

risposta(n).

risposta(_) :-
	scelta_non_riconosciuta,
	dettaglio.

informazioni(tutti) :-
	informazioni(t).

informazioni(t) :-
	analizza_tutti.

informazioni(v) :-
	write('--Quale veicolo vuoi analizzare?: '), read(Veicolo), nl,
	analizza_veicolo(Veicolo), nl.

informazioni(_) :-
	scelta_non_riconosciuta,
	risposta(s).

scelta_non_riconosciuta :-
	write('--Scelta non riconosciuta. Ricontrolla.'), nl, nl.
