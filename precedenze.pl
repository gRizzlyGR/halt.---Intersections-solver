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

primo(veicolo(X)) :-
	\+ precede(_, veicolo(X)),
	proviene(veicolo(X), Da),
	transita(veicolo(X), destra, A),
	adiacente(Da, A).
%	transita(veicolo(Y), _, A),
%	\+ precede(veicolo(Y), veicolo(X)).
	
precede(veicolo(X), veicolo(Y)) :-
%	\+ bracci_opposti(veicolo(X), veicolo(Y)),
	precedenza(veicolo(X), veicolo(Y)),
	X \= Y.

precedenza(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Y)).

%Precedenza regolata da segnali
precedenza(veicolo(X), veicolo(Y)) :-
	precedenza_frontale(veicolo(X), veicolo(Y)).

%Precedenza_frontale
precedenza_frontale(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), destra, braccio(Braccio)),
	transita(veicolo(Y), sinistra, braccio(Braccio)).

precedenza_frontale(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(Y), braccio(BraccioY)),
	transita(veicolo(X), dritto, braccio(BraccioY)),
	transita(veicolo(Y), sinistra, _).

%Tratta il caso in cui i due veicoli transitino l'uno nel braccio di provenienza dell'altro
bracci_opposti(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), BraccioX),
	proviene(veicolo(Y), BraccioY),
	transita(veicolo(X), _, BraccioY),
	transita(veicolo(Y), _, BraccioX).
