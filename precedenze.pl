:- module(precedenze, [
			primo/1,
			ultimo/1,
			prossimo/1,
			precede/2,
			passa_prima/2]).

:- use_module(destra2).
:- use_module(adiacenza).
:- use_module(opposti).
:- use_module(segnali).
:- use_module(library(lists)).

passa_prima(V1, V2) :-
	precede(V1, V2).

passa_prima(V1, V2) :-
	precede(V1, AltroVeicolo),
	passa_prima(AltroVeicolo, V2).

% Il primo veicolo a passare è il veicolo che ha la destra libera --FORSE INUTILE
%primo(V) :-
%	destra_libera(V).

% Altrimenti è il veicolo che non è preceduto da nessuno.
primo(V) :-
	transita(V, _, _),
	\+ precede(_, V).

% Se nell'incrocio c'è uno stallo, un veicolo prende l'iniziativa andando al centro e gli altri passano secondo le regole.
% Il veicolo al centro passerò per ultimo.
primo(V) :-
	attesa_cicolare([V | _]).


% Trova la sequenza di veicoli che passeranno.
prossimo(V) :-
%	precede(V, _),
	proviene(V, _),
	\+ primo(V),
	\+ ultimo(V).

ultimo(V) :-
	transita(V, _, _),
	\+ precede(V, _).

% Destra libera
destra_libera(V) :-
	transita(V, destra, _),
	\+ precede(_, V).

precede(_, V2) :-
	proviene(V2, Braccio),
	si_trova(Segnale, Braccio),
	segnale_precedenza(Segnale).

precede(V1, V2) :-
	da_destra(V1, V2),
	incrocia(V1, V2),
	V1 \= V2.

precede(V1, V2) :-
	precedenza_frontale(V1, V2),
	V1 \= V2.


%deve_dare_precedenza(V) :-
%	proviene(V, Braccio),
%	segnaletica(Braccio, _).

%deve_avere_precedenza(V) :-
	
	
% Precedenza_frontale
precedenza_frontale(V1, V2) :-
	transita(V1, destra, StessoBraccio),
	transita(V2, sinistra, StessoBraccio).

precedenza_frontale(V1, V2) :-
	proviene(V2, BraccioV2),
	transita(V1, dritto, BraccioV2),
	transita(V2, sinistra, _).

% Due veicoli transitano l'uno nel braccio di provenienza dell'altro
mia_dest_tua_prov(V1, V2) :-
	proviene(V1, BraccioV1),
	proviene(V2, BraccioV2),
	transita(V1, _, BraccioV2),
	transita(V2, _, BraccioV1).

incrocia(V1, V2) :-
	transitano_stesso_braccio(V1, V2).

incrocia(V1, V2) :-
	entrambi_dritto(V1, V2).

% Va scritto prima dell'altro che contiene "uno_a_sinistra" per via della variabile anonima
incrocia(V1, V2) :-
	entrambi_a_sinistra(V1, V2, VersoV1, VersoV2),
	proviene(V1, DaV1),
	proviene(V2, DaV2),
	adiacente(DaV1, DaV2),
	adiacente(VersoV1, VersoV2).

incrocia(V1, V2) :-
	uno_a_sinistra(V1, V2, VersoV1, VersoV2),
	proviene(V1, DaV1),
	proviene(V2, DaV2),
	adiacente(DaV1, DaV2),
	opposto(VersoV1, VersoV2).


transitano_stesso_braccio(V1, V2) :-
	transita(V1, _, StessoBraccio),
	transita(V2, _, StessoBraccio).

% Entrambi i veicoli vanno dritto
entrambi_dritto(V1, V2) :-
	transita(V1, dritto, _),
	transita(V2, dritto, _).

% Entrambi i veicoli vanno a sinistra.
entrambi_a_sinistra(V1, V2, BraccioV1, BraccioV2) :-
	transita(V1, sinistra, BraccioV1),
	transita(V2, sinistra, BraccioV2).

% Un veicolo va a sinistra.
uno_a_sinistra(V1, V2, BraccioV1, BraccioV2) :-
	transita(V1, sinistra, BraccioV1),
	transita(V2, _, BraccioV2).

uno_a_sinistra(V1, V2, BraccioV1, BraccioV2) :-
	transita(V1, _, BraccioV1),
	transita(V2, sinistra, BraccioV2).

% Può capitare che i veicoli nell'incrocio debbano dare la precedenza ad un veicolo e averla da un altro, in modo circolare;
% si viene così a creare una situazione di stallo che viene risolta quando un veicolo si porta al centro dell'incrocio
% così da permettere agli altri di transitare, secondo le regole standard. Il veicolo al centro passerà per ultimo.
attesa_cicolare(Veicoli) :-
	findall(V, proviene(V, _), Veicoli),
	stallo(Veicoli, []).


stallo([H|T], Acc) :-
	precede(H, Preceduto),
	\+ member(Preceduto, Acc),
	stallo(T, [Preceduto | Acc]).

stallo([], _).
