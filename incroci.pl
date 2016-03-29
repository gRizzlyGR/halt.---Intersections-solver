%%Segnali
%segnale(stop).
%segnale(dare_precedenza).

%%Veicoli
%veicolo(generico).
%veicolo(in_soccorso) :-
%	veicolo(ambulanza),
%	veicolo(polizia),

%incrocio(NumeroBracci, Segnali, Semafori, Veicoli) :-
%	intersezione(NumeroBracci, Segnali, Semafori, Veicoli)

%intersezione(NumeroBracci, Segnali, Semafori, Veicoli) :-
%	a_raso(NumeroBracci, Segnali, Semafori, Veicoli).
%%	livelli_sfalsati(NumeroBracci, Segnali, Semafori, Veicoli).

%a_raso(NumeroBracci, Segnali, Semafori, Veicoli) :-
%	tre_bracci(3, Segnali, Semafori, Veicoli);
%	quattro_bracci(4, Segnali, Semafori, Veicoli);
%	y(3, Segnali, Semafori, Veicoli).
%	%Maggiore di quattro bracci?
%	%Rotonda?

%precedenza(veicolo(in_soccorso), veicolo(_)).

%precedenza(veicolo(X), veicolo(Y)) :-
%	da_destra(veicolo(X), veicolo(Y).

%Exercises available at
%http://www.patentati.it/quiz-patente-b/argomento/precedenza-incroci-1.html

%These predicates are not grouped together for readability
:- discontiguous veicolo/1.
:- discontiguous da_destra/2.
:- discontiguous procede/2.


%Segnali di precedenza

%TO-DO: Add other road signs
segnale(dare_precedenza) :-
	segnale(precedenza).

segnale(stop) :-
	segnale(precedenza).


%Normally, vehicle facts are pointless. Here they are placed just as a remainder the crossroad components

%Vehicle atoms are identified with the same letter in exercises glued together with the exercise number

%%es1
%da_destra(veicolo(b1), veicolo(r1)).
%da_destra(veicolo(r1), veicolo(n1)).

%procede(veicolo(b1), sinistra).
%procede(veicolo(r1), dritto).
%procede(veicolo(n1), dritto).
%procede(veicolo(d1), sinistra).


%%es2
%da_destra(veicolo(b2), veicolo(h2)).
%da_destra(veicolo(h2), veicolo(c2)).

%procede(veicolo(b2), dritto).
%procede(veicolo(c2), dritto).
%procede(veicolo(h2), sinistra).


%%es3
%da_destra(veicolo(r3), veicolo(b3)).
%da_destra(veicolo(b3), veicolo(d3)).
%da_destra(veicolo(d3), veicolo(t3)).


%%es4
%da_destra(veicolo(h4), veicolo(a4)).
%da_destra(veicolo(a4), veicolo(f4)).
%da_destra(veicolo(f4), veicolo(l4)).

%procede(veicolo(h4), destra).
%procede(veicolo(a4), sinistra).
%procede(veicolo(f4), destra).
%procede(veicolo(l4), sinistra).


%es12

%%-----TO-DO: Implement signs

deve_rispettare(veicolo(b12), segnale(dare_precedenza)).
deve_rispettare(veicolo(p12), segnale(dare_precedenza)).

proviene(veicolo(b12), braccio_nord).
proviene(veicolo(g12), braccio_ovest).
proviene(veicolo(p12), braccio_sud).

procede(veicolo(b12), sinistra, braccio_est).
procede(veicolo(p12), dritto, braccio_nord).
procede(veicolo(g12), dritto, braccio_est).
%procede(veicolo(tram), _, _).

%Rules
precedenza(veicolo(tram), _).

%--TO-DO: Come diavolo faccio a dire che g12 è primo, dopo il tram???

%Precedenza regolata da segnali
precedenza(veicolo(X), veicolo(Y)) :-
	precedenza_frontale(veicolo(X), veicolo(Y)).

precedenza(veicolo(_), veicolo(Y)) :-
	deve_rispettare(veicolo(Y), segnale(precedenza)).

%Precedenza a destra
precedenza(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Y)).

precedenza(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Z)),
	precedenza(veicolo(Z), veicolo(Y)).

%Precedenza_frontale
precedenza_frontale(veicolo(X), veicolo(Y)) :-
	procede(veicolo(X), destra, Braccio),
	procede(veicolo(Y), sinistra, Braccio).

precedenza_frontale(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(Y), BraccioY),
	procede(veicolo(X), dritto, BraccioY),
	procede(veicolo(Y), sinistra, _).
		

%Sinistri --Da rivedere
sinistro(veicolo(X), veicolo(Y)) :-
	X \== Y,
	scontro(veicolo(X), veicolo(Y)).

sinistro(veicolo(X), veicolo(Y)) :-
	X \== Y,
	scontro(veicolo(Y), veicolo(X)).

scontro(veicolo(X), veicolo(Y)) :-
	precedenza(veicolo(X), veicolo(Y)),
	procede(veicolo(X), sinistra),
	procede(veicolo(Y), dritto).

scontro(veicolo(X), veicolo(Y)) :-
	precedenza(veicolo(X), veicolo(Y)),
	procede(veicolo(X), destra),
	procede(veicolo(Y), dritto).

scontro(veicolo(X), veicolo(Y)) :-
	procede(veicolo(X), dritto),
	procede(veicolo(Y), dritto).

%--TO-DO: l'ordine delle regole dovrebbe (FORSE) rispettare la priorità dei segnali: vigile, semaforo, verticali, orizzontali.
