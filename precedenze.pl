:- module(precedenze, [
			primo/1,
			ultimo/1,
			prossimo/1,
			precede/2,
			passa_prima/2,
			primi_insieme/1,
			prossimi_insieme/1,
			contemporanei/2,
			ultimi_insieme/1]).

:- use_module(destra2).
:- use_module(adiacenza).
:- use_module(opposti).
:- use_module(segnali).
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

% Se nell'incrocio c'è uno stallo, un veicolo prende l'iniziativa andando al centro e gli altri passano secondo le regole.
% Il veicolo al centro passerò per ultimo.

%primo(V) :-
%	attesa_cicolare([V | _]).


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
	con_segnale_precedenza(V2),
	\+ con_segnale_precedenza(V1).


precede(V1, V2) :-
	\+ con_segnale_precedenza(V1),

	precede_da_destra(V1, V2);
	precedenza_frontale(V1, V2),

	V1 \= V2.


precede_da_destra(V1, V2) :-
	da_destra(V1, V2),
	incrocia(V1, V2).
	
	
precedenza_frontale(V1, V2) :-
	transita(V1, destra, StessoBraccio),
	transita(V2, sinistra, StessoBraccio).

precedenza_frontale(V1, V2) :-
	proviene(V2, BraccioV2),
	transita(V1, dritto, BraccioV2),
	transita(V2, sinistra, _).

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

% Entrambi i veicoli vanno dritto in bracci non opposti. Copre il caso in cui i veicoli vanno uno nel braccio 
% di provienenza dell'altro o in bracci adiacenti ai medesimi.
entrambi_dritto(V1, V2) :-
	transita(V1, dritto, BraccioV1),
	transita(V2, dritto, BraccioV2),
	\+ opposto(BraccioV1, BraccioV2).

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


% Permette di stabilire un ordine di circolazione
passa_prima(V1, V2) :-
	precede(V1, V2).

passa_prima(V1, V2) :-
	precede(V1, AltroVeicolo),
	passa_prima(AltroVeicolo, V2).

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

% Caso in cui più veicoli passano nello stesso momento
primi_insieme(Veicoli) :-
	findall(V, primo(V), Veicoli),
	piu_di_uno(Veicoli).

prossimi_insieme(Veicoli) :-
	findall(V, contemporanei(V, _), Veicoli),
	piu_di_uno(Veicoli).
	
contemporanei(V1, V2) :-
	precede(StessoVeicolo, V1),
	precede(StessoVeicolo, V2),
	V1 \= V2,
	\+ precede(V1, V2),
	\+ precede(V2, V1).

ultimi_insieme(Veicoli) :-
	findall(V, ultimo(V), Veicoli),
	piu_di_uno(Veicoli).

piu_di_uno(Lista) :-
	length(Lista, N),
	N > 1.
