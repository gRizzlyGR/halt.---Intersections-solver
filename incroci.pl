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

%es1
veicolo(b1).
veicolo(r1).
veicolo(n1).
veicolo(d1).

da_destra(veicolo(b1), veicolo(r1)).
da_destra(veicolo(r1), veicolo(n1)).

procede(veicolo(b1), sinistra).
procede(veicolo(r1), dritto).
procede(veicolo(n1), dritto).
procede(veicolo(d1), sinistra).

%es2
veicolo(b2).
veicolo(c2).
veicolo(h2).

da_destra(veicolo(b2), veicolo(h2)).
da_destra(veicolo(h2), veicolo(c2)).

procede(veicolo(b2), dritto).
procede(veicolo(c2), dritto).
procede(veicolo(h2), sinistra).

%es3
veicolo(r3).
veicolo(b3).
veicolo(d3).
veicolo(t3).

da_destra(veicolo(r3), veicolo(b3)).
da_destra(veicolo(b3), veicolo(d3)).
da_destra(veicolo(d3), veicolo(t3)).

%Rules
veicolo(in_soccorso) :-
	veicolo(ambulanza);
	veicolo(polizia).

precedenza(veicolo(in_soccorso), _).
precedenza(veicolo(tram), _).

precedenza(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Y)).

precedenza(veicolo(X), veicolo(Y)) :-
	da_destra(veicolo(X), veicolo(Z)),
	precedenza(veicolo(Z), veicolo(Y)).

sinistro(veicolo(X), veicolo(Y)) :-
	scontro(veicolo(X), veicolo(Y)).

sinistro(veicolo(X), veicolo(Y)) :-
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



