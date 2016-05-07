%--TO-DO: Precedenza frontale è un tipo di precedenza a destra, tipo
%-- da_destra(x, Y) :- precedenza_frontale(X,Y).

:- use_module(destra).
:- use_module(adiacenza).
:- use_module(opposti).

%:- dynamic controlla/2.

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

%Non funziona
primo(veicolo(X)) :-
	\+ precede(_, veicolo(X)).
%	proviene(veicolo(X), Da),
%	transita(veicolo(X), destra, A),
%	adiacente(Da, A).
%	transita(veicolo(Y), _, A),
%	\+ precede(veicolo(Y), veicolo(X)).

precede(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Y)),
	incrocia(veicolo(X), veicolo(Y)),
	X \= Y.

precede(veicolo(X), veicolo(Y)) :-
	precedenza_frontale(veicolo(X), veicolo(Y)),
	X \= Y.

%Precedenza_frontale
precedenza_frontale(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), destra, braccio(Braccio)),
	transita(veicolo(Y), sinistra, braccio(Braccio)).

precedenza_frontale(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(Y), braccio(BraccioY)),
	transita(veicolo(X), dritto, braccio(BraccioY)),
	transita(veicolo(Y), sinistra, _).

%Tratta il caso in cui i due veicoli transitino l'uno nel braccio di provenienza dell'altro
mia_dest_tua_prov(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), BraccioX),
	proviene(veicolo(Y), BraccioY),
	transita(veicolo(X), _, BraccioY),
	transita(veicolo(Y), _, BraccioX).

transitano_stesso_braccio(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), _, StessoBraccio),
	transita(veicolo(Y), _, StessoBraccio).

incrocia(veicolo(X), veicolo(Y)) :-
	transitano_stesso_braccio(veicolo(X), veicolo(Y)).

incrocia(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), _),
	proviene(veicolo(Y), _),
	entrambi_dritto(veicolo(X), veicolo(Y)).

incrocia(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), DaX),
	proviene(veicolo(Y), DaY),
	adiacente(DaX, DaY),
	entrambi_a_sinistra(veicolo(X), veicolo(Y), braccio(VersoX), braccio(VersoY)),
	adiacente(VersoX, VersoY).

incrocia(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), DaX),
	proviene(veicolo(Y), DaY),
	adiacente(DaX, DaY),
	uno_a_sinistra(veicolo(X), veicolo(Y), braccio(VersoX), braccio(VersoY)),
	opposto(VersoX, VersoY).

%Entrambi i veicoli vanno dritto
entrambi_dritto(veicolo(X), veicolo(Y)) :-
	transita(veicolo(X), dritto, _),
	transita(veicolo(Y), dritto, _).

%Entrambi i veicoli vanno a sinistra. Va scritto prima di 'uno_a_sinitra' per via della variabile anonima che accetta tutto
entrambi_a_sinistra(veicolo(X), veicolo(Y), braccio(BraccioX), braccio(BraccioY)) :-
	transita(veicolo(X), sinistra, BraccioX),
	transita(veicolo(Y), sinistra, BraccioY).

%Un veicolo va a sinistra.
uno_a_sinistra(veicolo(X), veicolo(Y), braccio(BraccioX), braccio(BraccioY)) :-
	transita(veicolo(X), sinistra, BraccioX),
	transita(veicolo(Y), _, BraccioY).
	
uno_a_sinistra(veicolo(X), veicolo(Y), braccio(BraccioX), braccio(BraccioY)) :-
	transita(veicolo(X), _, BraccioX),
	transita(veicolo(Y), sinistra, BraccioY).


va_al_centro(veicolo(X)) :-
	precede(veicolo(X), veicolo(Y)),
	precede(veicolo(Y), veicolo(Z)),
	precede(veicolo(Z), veicolo(X)).
