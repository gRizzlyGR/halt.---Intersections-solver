:- module(precedenze, [
			primo/1,
			ultimo/1,
			prossimo/1,
			precede/2,
			passa_prima/2,
			tutti_i_primi/1,
			tutti_i_prossimi/1,
			prossimi_insieme/1,
			simultaneo/2,
			tutti_gli_ultimi/1
			]).

:- use_module(destra).
:- use_module(adiacenza).
:- use_module(opposti).
:- use_module(segnali).
:- use_module(prioritari).
:- use_module(gestore_kb).
:- use_module(movimento).
:- use_module(library(lists)).



% Il primo veicolo a passare è il veicolo che ha la destra libera --FORSE INUTILE
%primo(V) :-
%	destra_libera(V).


% Altrimenti è il veicolo che non è preceduto da nessuno.
primo(V) :-
%	transita(V, _, _),
	proviene(V, _),
	\+ con_segnale_precedenza(V),
	\+ precede(_, V).

% Trova la sequenza di veicoli che passeranno.
prossimo(V) :-
%	precede(V, _),
	proviene(V, _),
	\+ primo(V),
	\+ ultimo(V).

ultimo(V) :-
%	transita(V, _, _),
	proviene(V, _),
	\+ precede(V, _),
	\+ simultaneo(V, _),
	precede(_, V).

% Destra libera ---FORSE INUTILE
destra_libera(V) :-
	transita(V, destra, _),
	\+ precede(_, V).

con_segnale_precedenza(V) :-
	proviene(V, Braccio),
	segnaletica(Braccio, Segnale),
	segnale_precedenza(Segnale).
	

precede(V1, V2) :-
	proviene(V1, _),
	proviene(V2, _),
	V1 \= V2,

%	\+ destra_libera(V2),

	precedenza_prioritaria(V1, V2).

precede(V1, V2) :-
	proviene(V1, _),
	proviene(V2, _),


	\+ prioritario(V1),
	\+ prioritario(V2),

	V1 \= V2,

	precedenza_ordinaria(V1, V2).


% Entrambi i veicoli sono soggetti a segnali di precedenza
precede(V1, V2) :-
	con_segnale_precedenza(V1),
	con_segnale_precedenza(V2),
	precede_da_destra(V1, V2).

precede(V1, V2) :-
	con_segnale_precedenza(V1),
	con_segnale_precedenza(V2),
	precedenza_frontale(V1, V2).

% Casi particolari con veicoli prioritari
precedenza_prioritaria(V1, V2) :-
	alta_priorita(V1),
	\+ alta_priorita(V2).

precedenza_prioritaria(V1, V2) :-
	media_priorita(V1),
	\+ alta_priorita(V2).


% In caso si incrocino due veicoli ad alta priorità, valgono le normali regole di precedenza
precedenza_prioritaria(V1, V2) :-
	alta_priorita(V1),
	alta_priorita(V2),
	precede_da_destra(V1, V2).

precedenza_prioritaria(V1, V2) :-
	alta_priorita(V1),
	alta_priorita(V2),
	precedenza_frontale(V1, V2).
	

% Casi generali di precedenza
precedenza_ordinaria(V1, V2) :-
	con_segnale_precedenza(V2),
	\+ con_segnale_precedenza(V1).

precedenza_ordinaria(V1, V2) :-
	\+ con_segnale_precedenza(V1),
	precede_da_destra(V1, V2).

precedenza_ordinaria(V1, V2) :-
	\+ con_segnale_precedenza(V1),
	precedenza_frontale(V1, V2).


precede_da_destra(V1, V2) :-
	da_destra(V1, V2),
	incrocia(V1, V2),
	\+ svolta_a_u(V1, V2).
	
	
precedenza_frontale(V1, V2) :-
	transita(V1, destra, StessoBraccio),
	transita(V2, sinistra, StessoBraccio).

precedenza_frontale(V1, V2) :-
	proviene(V2, BraccioV2),
	transita(V1, dritto, BraccioV2),
	transita(V2, sinistra, _).

%incrocia(V1, V2) :-
%	transitano_stesso_braccio(V1, V2).

%incrocia(V1, V2) :-
%	entrambi_dritto(V1, V2).

%incrocia(V1, V2) :-
%	entrambi_a_sinistra(V1, V2, VersoV1, VersoV2),
%	proviene(V1, DaV1),
%	proviene(V2, DaV2),
%	adiacente(DaV1, DaV2),
%	adiacente(VersoV1, VersoV2).

%incrocia(V1, V2) :-
%	uno_a_sinistra(V1, V2, VersoV1, VersoV2),
%	proviene(V1, DaV1),
%	proviene(V2, DaV2),
%	adiacente(DaV1, DaV2),
%	opposto(VersoV1, VersoV2).

%incrocia(V1, V2) :-
%	uno_a_sinistra(V1, V2, _, _),
%	nel_braccio_dell_altro(V1, V2),
%	\+ dove_vado_uguale_dove_vieni(V1, V2).

% Permette di stabilire un ordine di circolazione
passa_prima(V1, V2) :-
	precede(V1, V2).

passa_prima(V1, V2) :-
	precede(V1, AltroVeicolo),
	passa_prima(AltroVeicolo, V2).
	

% Uno o più veicoli passano nello stesso momento
tutti_i_primi(Veicoli) :-
	setof(V, primo(V), Veicoli).

tutti_i_prossimi(Veicoli) :-
	setof(Prossimo, prossimo(Prossimo), Veicoli).

prossimi_insieme(Veicoli) :-
	setof(V1, V2^simultaneo(V1, V2), Veicoli).
	
simultaneo(V1, V2) :-
	precede(StessoVeicolo, V1),
	precede(StessoVeicolo, V2),
	V1 \= V2,
	\+ precede(V1, V2),
	\+ precede(V2, V1),
	almeno_uno_precede(V1, V2).

% Almeno uno tra i veicoli simultanei deve precedere un altro veicolo,
% che a sua volta non deve precedere un altro veicolo simultaneo
almeno_uno_precede(V1, V2) :-
	precede(V1, Altro),
	\+ precede(Altro, V2).

almeno_uno_precede(V1, V2) :-
	precede(V2, Altro),
	\+ precede(Altro, V1).

tutti_gli_ultimi(Veicoli) :-
	setof(V, ultimo(V), Veicoli).
