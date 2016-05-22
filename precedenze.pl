:- use_module(destra).
:- use_module(adiacenza).
:- use_module(opposti).
:- use_module(segnali).
:- use_module(library(lists)).
:- use_module(msg).
:- use_module(utils).


%prim(V) :-
%	findall(V, primo(V), L),
%	devono_andare(L).


%devono_andare(L) :-
%	length(L, N),
%	N > 1,
%	msg:primi_a_passare(L).

%devono_andare([Primo]) :-
%	msg:primo_a_passare(Primo).
	



circolazione :-
	primo(Primo),
	msg:primo_a_passare(Primo),
	
	findall(Prossimo, prossimo(Prossimo), Tmp),
	utils:set(Tmp, Prossimi),
	msg:prossimi_a_passare(Prossimi),	
		
	ultimo(Ultimo),
	msg:ultimo_a_passare(Ultimo).

% Il primo veicolo a passare è il veicolo che ha la destra libera --FORSE INUTILE
primo(V) :-
	destra_libera(V),
	!.

% Altrimenti è il veicolo che non è preceduto da nessuno. Cut per evitare duplicati
primo(V) :-
	transita(V, _, _),
	\+ precede(_, V),
	!.

% Se nell'incrocio c'è uno stallo, un veicolo prende l'iniziativa andando al centro e gli altri passano secondo le regole.
% Il veicolo al centro passerò per ultimo.
primo(V) :-
	attesa_cicolare([V | _]),
	msg:va_al_centro(V). 


% Trova la sequenza di veicoli che passeranno. Alcuni veicoli possono avere la precedenza su più veicoli, quindi viene fatto un
% controllo per evitare duplicati.
prossimo(V) :-
	precede(V, _),
	\+ primo(V),
	\+ ultimo(V).

% Cut per eviare duplicati
ultimo(V) :-
	precede(_, V),
	\+ precede(V, _),
	!.

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
	

%sameElem([prec(veicolo(A), _)|T]) :-
%	reverse(T, [prec(_, veicolo(A))|_]).


% Helper per l'inverso di una lista	
%rev(L,R):-
%	accRev(L, [], R).

%accRev([H|T], A, R):-
%	accRev(T, [H|A], R).

%accRev([], A, A).

% Member
%member(H, [H|_]).
%member(Elem, [_|T]):-
%	member(Elem, T).
