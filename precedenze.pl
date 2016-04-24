%--TO-DO: Precedenza frontale è un tipo di precedenza a destra, tipo
%-- da_destra(x, Y) :- precedenza_frontale(X,Y).

:- use_module(destra).
:- use_module(adiacenza).

%Rules
%%%nessun_obbligo(veicolo(X)) :-
%%%	\+ deve_rispettare(veicolo(X), segnale(_)).

%%%nessun_obbligo(veicolo(X)) :-
%%%	destra_libera(veicolo(X)).

%Segnali di precedenza

%--TO-DO: Add other road signs

segnale(precedenza).

segnale(precedenza) :-
	segnale(dare_precedenza).

segnale(precedenza) :-
	segnale(stop).

%Precedenza a destra


precede(veicolo(X), veicolo(_)) :-
	proviene(veicolo(X), braccio(BraccioProv)),
	procede(veicolo(X), destra, braccio(BraccioArr)),
	adiacente(braccio(BraccioProv), braccio(BraccioArr)). 

precede(veicolo(X), veicolo(Y)) :-
	precedenza(veicolo(X), veicolo(Y)),
	X \= Y.

%destra_libera(veicolo(X)) :-
%	\+ da_destra(veicolo(_), veicolo(X)).

precedenza(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Y)).

%da_destra(veicolo(X), veicolo(Y)) :-
%	precedenza_frontale(veicolo(X), veicolo(Y)).

%precedenza(veicolo(X), veicolo(Y)) :-
%	da_destra(veicolo(X), veicolo(Z)),
%	precedenza(veicolo(Z), veicolo(Y)).


%precedenza(veicolo(X), veicolo(Y)) :-
%	nessun_obbligo(veicolo(X)),
%	procede(veicolo(X), _, _),
%	X \== Y.

%Precedenza regolata da segnali
precedenza(veicolo(X), veicolo(Y)) :-
	precedenza_frontale(veicolo(X), veicolo(Y)).

%precedenza(veicolo(_), veicolo(Y)) :-
%	deve_rispettare(veicolo(Y), segnale(precedenza)).

%da_destra(veicolo(X), veicolo(Y)) :-
%	precedenza_frontale(veicolo(X), veicolo(Y)).

%Precedenza_frontale
precedenza_frontale(veicolo(X), veicolo(Y)) :-
	procede(veicolo(X), destra, braccio(Braccio)),
	procede(veicolo(Y), sinistra, braccio(Braccio)).

precedenza_frontale(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(Y), braccio(BraccioY)),
	procede(veicolo(X), dritto, braccio(BraccioY)),
	procede(veicolo(Y), sinistra, _).	
