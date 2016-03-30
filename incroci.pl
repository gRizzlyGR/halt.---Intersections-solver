:- ['precedenze.pl'].

%Exercises available at
%http://www.patentati.it/quiz-patente-b/argomento/precedenza-incroci-1.html

%Solutions:
%http://www.patentati.it/quiz-patente-b/lista-domande/precedenza-incroci.html

%These predicates are not grouped together for readability
:- discontiguous veicolo/1.
:- discontiguous da_destra/2.
:- discontiguous procede/2.
:- discontiguous nessun_obbligo/1.

%Vehicle atoms are identified with the same letter labels in exercise glued together with the exercise number

%%es1 sol: b (al centro) - r - (n-d insieme)
%da_destra(veicolo(b1), veicolo(r1)).
%da_destra(veicolo(r1), veicolo(n1)).
%da_destra(veicolo(r1), veicolo(d1)).

%procede(veicolo(b1), sinistra, braccio_est).
%procede(veicolo(r1), dritto, braccio_ovest).
%procede(veicolo(n1), dritto, braccio_nord).
%procede(veicolo(d1), sinistra, braccio_ovest).

%proviene(veicolo(b1), braccio_nord).
%proviene(veicolo(r1), braccio_est).
%proviene(veicolo(n1), braccio_sud).
%proviene(veicolo(d1), braccio_sud).

%%%%%%da_destra(veicolo(b), veicolo(a)).
%%%%%%da_destra(veicolo(a), veicolo(c)).

%%%%%%procede(veicolo(b), destra, braccio_ovest).
%%%%%%procede(veicolo(a), dritto, braccio_ovest).
%%%%%%procede(veicolo(c), sinistra, braccio_ovest).

%%%%%%proviene(veicolo(b), braccio_nord).
%%%%%%proviene(veicolo(a), braccio_est).
%%%%%%proviene(veicolo(c), braccio_sud).

%%es2 sol: b-h-c
%da_destra(veicolo(b2), veicolo(h2)).
%da_destra(veicolo(h2), veicolo(c2)).

%procede(veicolo(b2), dritto, braccio_ovest).
%procede(veicolo(c2), dritto, braccio_est).
%procede(veicolo(h2), sinistra, braccio_ovest).

%proviene(veicolo(b2), braccio_est).
%proviene(veicolo(h2), braccio_sud).
%proviene(veicolo(c2), braccio_ovest).


%%es3 sol: r-b-d-t
da_destra(veicolo(r3), veicolo(b3)).
da_destra(veicolo(b3), veicolo(d3)).
da_destra(veicolo(d3), veicolo(t3)).

procede(veicolo(r3), destra, braccio(sud_ovest)).
procede(veicolo(b3), sinistra, braccio(sud_ovest)).
procede(veicolo(d3), sinistra, braccio(sud_ovest)).
procede(veicolo(t3), destra, braccio(est)).

proviene(veicolo(r3), braccio(nord)).
proviene(veicolo(b3), braccio(est)).
proviene(veicolo(d3), braccio(sud_est)).
proviene(veicolo(t3), braccio(sud_ovest)).


%%es4
%da_destra(veicolo(h4), veicolo(a4)).
%da_destra(veicolo(a4), veicolo(f4)).
%da_destra(veicolo(f4), veicolo(l4)).

%procede(veicolo(h4), destra).
%procede(veicolo(a4), sinistra).
%procede(veicolo(f4), destra).
%procede(veicolo(l4), sinistra).


%es12

%proviene(veicolo(b12), braccio_nord).
%proviene(veicolo(g12), braccio_ovest).
%proviene(veicolo(p12), braccio_sud).

%procede(veicolo(b12), sinistra, braccio_est).
%procede(veicolo(p12), dritto, braccio_nord).
%procede(veicolo(g12), dritto, braccio_est).
%procede(veicolo(tram)).

%deve_rispettare(veicolo(b12), segnale(dare_precedenza)).
%deve_rispettare(veicolo(p12), segnale(dare_precedenza)).

%nessun_obbligo(veicolo(g12)).
