:- use_module(destra).
:- use_module(adiacenza).
:- use_module(opposti).
:- use_module(segnali).
:- use_module(library(lists)).
:- use_module(msg).
%Rules
%%%nessun_obbligo(veicolo(X)) :-
%%%	\+ deve_rispettare(veicolo(X), segnale(_)).

%%%nessun_obbligo(veicolo(X)) :-
%%%	destra_libera(veicolo(X)).

%Segnali di precedenza

%--TO-DO: Add other road signs

% Il primo veicolo a passare è il veicolo che ha la destra libera
primo(veicolo(X)) :-
	destra_libera(veicolo(X)),
	msg:primo_a_passare(X).

% Se nell'incrocio c'è uno stallo, un veicolo prende l'iniziativa andando al centro e gli altri passano secondo le normali regole.
% Il veicolo al centro passerò per ultimo.
primo(veicolo(X)) :-
	attesa_cicolare([veicolo(X) | _]),	
	msg:va_al_centro(X). 

% Destra libera
destra_libera(veicolo(X)) :-
	transita(veicolo(X), destra, _),
	\+ precede(_, veicolo(X)).

precede(_, veicolo(Y)) :-
	proviene(veicolo(Y), braccio(B)),
	si_trova(segnale(S), braccio(B)),
	segnale_precedenza(S).

precede(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Y)),
	incrocia(veicolo(X), veicolo(Y)).
%	X \= Y.

precede(veicolo(X), veicolo(Y)) :-
	precedenza_frontale(veicolo(X), veicolo(Y)).
%	X \= Y.

% Precedenza_frontale
precedenza_frontale(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), destra, braccio(StessoBraccio)),
	transita(veicolo(Y), sinistra, braccio(StessoBraccio)).

precedenza_frontale(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(Y), braccio(BraccioY)),
	transita(veicolo(X), dritto, braccio(BraccioY)),
	transita(veicolo(Y), sinistra, _).

% Due veicoli transitano l'uno nel braccio di provenienza dell'altro
mia_dest_tua_prov(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), BraccioX),
	proviene(veicolo(Y), BraccioY),
	transita(veicolo(X), _, BraccioY),
	transita(veicolo(Y), _, BraccioX).

incrocia(veicolo(X), veicolo(Y)) :-
	transitano_stesso_braccio(veicolo(X), veicolo(Y)).

incrocia(veicolo(X), veicolo(Y)) :-
	entrambi_dritto(veicolo(X), veicolo(Y)).

% Va scritto prima dell'altro che contiene "uno a sinistra" per via della variabile anonima che accetta tutto
incrocia(veicolo(X), veicolo(Y)) :-
	entrambi_a_sinistra(veicolo(X), veicolo(Y), braccio(VersoX), braccio(VersoY)),
	proviene(veicolo(X), DaX),
	proviene(veicolo(Y), DaY),
	adiacente(DaX, DaY),
	adiacente(VersoX, VersoY).

incrocia(veicolo(X), veicolo(Y)) :-
	uno_a_sinistra(veicolo(X), veicolo(Y), braccio(VersoX), braccio(VersoY)),
	proviene(veicolo(X), DaX),
	proviene(veicolo(Y), DaY),
	adiacente(DaX, DaY),
	opposto(VersoX, VersoY).


transitano_stesso_braccio(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), _, StessoBraccio),
	transita(veicolo(Y), _, StessoBraccio).

% Entrambi i veicoli vanno dritto
entrambi_dritto(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), dritto, _),
	transita(veicolo(Y), dritto, _).

% Entrambi i veicoli vanno a sinistra.
entrambi_a_sinistra(veicolo(X), veicolo(Y), braccio(BraccioX), braccio(BraccioY)) :-
	transita(veicolo(X), sinistra, BraccioX),
	transita(veicolo(Y), sinistra, BraccioY).

% Un veicolo va a sinistra.
uno_a_sinistra(veicolo(X), veicolo(Y), braccio(BraccioX), braccio(BraccioY)) :-
	transita(veicolo(X), sinistra, BraccioX),
	transita(veicolo(Y), _, BraccioY).
	
uno_a_sinistra(veicolo(X), veicolo(Y), braccio(BraccioX), braccio(BraccioY)) :-
	transita(veicolo(X), _, BraccioX),
	transita(veicolo(Y), sinistra, BraccioY).

% Può capitare che i veicoli nell'incrocio debbano dare la precedenza ad un veicolo e averla da un altro, in modo circolare;
% si viene così a creare una situazione di stallo che viene risolta quando un veicolo si porta al centro dell'incrocio
% così da permettere agli altri di transitare, secondo le regole standard. Il veicolo al centro passerà per ultimo.
attesa_cicolare(Veicoli) :-
	findall(X, proviene(X, _), Veicoli),
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
