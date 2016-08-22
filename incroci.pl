:- dynamic segnaletica/2.

%:- ['precedenze.pl'].

%Exercises available at
%http://www.patentati.it/quiz-patente-b/argomento/precedenza-incroci-1.html

%Solutions:
%http://www.patentati.it/quiz-patente-b/lista-domande/precedenza-incroci.html

%Vehicle atoms are identified with the same letter labels in exercise glued together with the exercise number

%%es1 sol: b (al centro) - r - (n-d insieme)
%da_destra(veicolo(b1), veicolo(r1)).
%da_destra(veicolo(r1), veicolo(n1)).
%da_destra(veicolo(r1), veicolo(d1)).

%transita(veicolo(b1), sinistra, braccio_est).
%transita(veicolo(r1), dritto, braccio_ovest).
%transita(veicolo(n1), dritto, braccio_nord).
%transita(veicolo(d1), sinistra, braccio_ovest).

%proviene(veicolo(b1), braccio_nord).
%proviene(veicolo(r1), braccio_est).
%proviene(veicolo(n1), braccio_sud).
%proviene(veicolo(d1), braccio_sud).

%%%%%%da_destra(veicolo(b), veicolo(a)).
%%%%%%da_destra(veicolo(a), veicolo(c)).

%%%%%%transita(veicolo(b), destra, braccio_ovest).
%%%%%%transita(veicolo(a), dritto, braccio_ovest).
%%%%%%transita(veicolo(c), sinistra, braccio_ovest).

%%%%%%proviene(veicolo(b), braccio_nord).
%%%%%%proviene(veicolo(a), braccio_est).
%%%%%%proviene(veicolo(c), braccio_sud).

%%es2 sol: b-h-c
%da_destra(veicolo(b2), veicolo(h2)).
%da_destra(veicolo(h2), veicolo(c2)).

%transita(veicolo(b2), dritto, braccio_ovest).
%transita(veicolo(c2), dritto, braccio_est).
%transita(veicolo(h2), sinistra, braccio_ovest).

%proviene(veicolo(b2), braccio_est).
%proviene(veicolo(h2), braccio_sud).
%proviene(veicolo(c2), braccio_ovest).


%%es3 sol: r-b-d-t
%da_destra(veicolo(r3), veicolo(b3)).
%da_destra(veicolo(b3), veicolo(d3)).
%da_destra(veicolo(d3), veicolo(t3)).

%es3
%transita(veicolo(r3), destra, braccio(sud_ovest)).
%transita(veicolo(b3), sinistra, braccio(sud_ovest)).
%transita(veicolo(d3), sinistra, braccio(sud_ovest)).
%transita(veicolo(t3), destra, braccio(est)).

%proviene(veicolo(r3), braccio(nord)).
%proviene(veicolo(b3), braccio(est)).
%proviene(veicolo(d3), braccio(sud_est)).
%proviene(veicolo(t3), braccio(sud_ovest)).


%%es4

%proviene(veicolo(test), braccio(nord)).

%proviene(veicolo(h4), braccio(sud_ovest)).
%proviene(veicolo(a4), braccio(nord_ovest)).
%proviene(veicolo(f4), braccio(nord_est)).
%proviene(veicolo(l4), braccio(sud_est)).

%transita(veicolo(test), destra, braccio(est)).

%transita(veicolo(h4), destra, braccio(sud_est)).
%transita(veicolo(a4), sinistra, braccio(sud_est)).
%transita(veicolo(f4), destra, braccio(sud_ovest)).
%transita(veicolo(l4), sinistra, braccio(sud_ovest)).


%---fig.606
%proviene(veicolo(c), braccio(est)).
%proviene(veicolo(e), braccio(ovest)).
%proviene(veicolo(m), braccio(sud)).

%transita(veicolo(e), destra, braccio(sud)).
%transita(veicolo(m), sinistra, braccio(ovest)).
%transita(veicolo(c), sinistra, braccio(sud)).


%---fig.608


%---fig.617. N si sposta al centro.
%proviene(veicolo(n), braccio(nord)).
%proviene(veicolo(r), braccio(est)).
%proviene(veicolo(a), braccio(sud)).

%transita(veicolo(n), sinistra, braccio(est)).
%transita(veicolo(r), dritto, braccio(ovest)).
%transita(veicolo(a), dritto, braccio(nord)).

%Modificato con l'aggiunta di B
%proviene(veicolo(n), braccio(nord)).
%proviene(veicolo(r), braccio(est)).
%proviene(veicolo(a), braccio(sud)).
%proviene(veicolo(b), braccio(ovest)).

%transita(veicolo(n), sinistra, braccio(est)).
%transita(veicolo(r), sinistra, braccio(sud)).
%transita(veicolo(a), dritto, braccio(nord)).
%transita(veicolo(b), dritto, braccio(est)).

%---fig.632
%proviene(veicolo(b), braccio(nord_ovest)).
%proviene(veicolo(n), braccio(est)).
%proviene(veicolo(d), braccio(sud_ovest)).
%proviene(veicolo(p), braccio(ovest)).

%transita(veicolo(b), dritto, braccio(sud_ovest)).
%transita(veicolo(n), dritto, braccio(ovest)).
%transita(veicolo(d), destra, braccio(est)).
%transita(veicolo(p), dritto, braccio(est)).

%---fig.634
%proviene(veicolo(c), braccio(nord_ovest)).
%proviene(veicolo(l), braccio(sud_est)).
%proviene(veicolo(a), braccio(sud_ovest)).

%transita(veicolo(l), sinistra, braccio(sud_ovest)).
%transita(veicolo(c), dritto, braccio(sud_est)).
%transita(veicolo(a), destra, braccio(sud_est)).


%---fig.638. B si sposta al centro
%proviene(veicolo(b), braccio(nord)).
%proviene(veicolo(r), braccio(est)).
%proviene(veicolo(n), braccio(sud)).
%proviene(veicolo(d), braccio(sud)).

%transita(veicolo(b), sinistra, braccio(est)).
%transita(veicolo(r), dritto, braccio(ovest)).
%transita(veicolo(n), dritto, braccio(nord)).
%transita(veicolo(d), sinistra, braccio(ovest)).

%---fig.660
%proviene(veicolo(d), braccio(est)).
%proviene(veicolo(h), braccio(nord)).
%proviene(veicolo(b), braccio(ovest)).

%transita(veicolo(b), sinistra, braccio(nord)).
%transita(veicolo(d), dritto, braccio(ovest)).
%transita(veicolo(h), destra, braccio(ovest)).


%---fig.640
%proviene(veicolo(b), braccio(ovest)).
%proviene(veicolo(r), braccio(est)).
%proviene(veicolo(l), braccio(non_lo_so)).
%proviene(veicolo(d), braccio(sud)).

%transita(veicolo(b), dritto, braccio(est)).
%transita(veicolo(r), dritto, braccio(ovest)).
%transita(veicolo(l), dritto, braccio(est)).
%transita(veicolo(d), dritto, braccio(nord)).


%---fig.643
%proviene(veicolo(b), braccio(sud)).
%proviene(veicolo(l), braccio(ovest)).
%proviene(veicolo(h), braccio(nord)).
%proviene(veicolo(d), braccio(est)).

%transita(veicolo(b), sinistra, braccio(ovest)).
%transita(veicolo(l), dritto, braccio(est)).
%transita(veicolo(h), destra, braccio(ovest)).
%transita(veicolo(d), dritto, braccio(ovest)).


%---fig.647
%proviene(veicolo(b), braccio(nord)).
%proviene(veicolo(l), braccio(est)).
%proviene(veicolo(o), braccio(sud)).
%proviene(veicolo(h), braccio(ovest)).

%transita(veicolo(b), destra, braccio(ovest)).
%transita(veicolo(l), dritto, braccio(ovest)).
%transita(veicolo(o), sinistra, braccio(ovest)).
%transita(veicolo(h), dritto, braccio(est)).

%si_trova(segnale(dare_precedenza), braccio(nord)).
%si_trova(segnale(dare_precedenza), braccio(sud)).

%---fig.655

%proviene(veicolo(r), braccio(est)).
%proviene(veicolo(s), braccio(sud)).
%proviene(veicolo(a), braccio(nord)).
%proviene(veicolo(e), braccio(ovest)).

%transita(veicolo(e), dritto, braccio(est)).
%transita(veicolo(s), dritto, braccio(nord)).
%transita(veicolo(a), sinistra, braccio(est)).
%transita(veicolo(r), sinistra, braccio(sud)).

%segnaletica(braccio(est), segnale(dare_precedenza)).
%segnaletica(braccio(ovest), segnale(dare_precedenza)).


%---fig.665

%proviene(veicolo(c), braccio(sud_ovest)).
%proviene(veicolo(a), braccio(ovest)).
%proviene(veicolo(e), braccio(nord)).
%proviene(veicolo(v), braccio(est)).
%proviene(veicolo(h), braccio(sud_est)).

%transita(veicolo(a), sinistra, braccio(nord)).
%transita(veicolo(c), destra, braccio(est)).
%transita(veicolo(e), dritto, braccio(sud_ovest)).
%transita(veicolo(h), sinistra, braccio(sud_ovest)).
%transita(veicolo(v), sinistra, braccio(sud_ovest)).

%---fig.669

proviene(veicolo(r), braccio(nord_est)).
proviene(veicolo(e), braccio(est)).
proviene(veicolo(c), braccio(sud_est)).
proviene(veicolo(a), braccio(sud_ovest)).
proviene(veicolo(l), braccio(nord_ovest)).

transita(veicolo(e), dritto, braccio(ovest)).
transita(veicolo(c), sinistra, braccio(sud_ovest)).
transita(veicolo(r), destra, braccio(ovest)).
transita(veicolo(l), sinistra, braccio(est)).
transita(veicolo(a), destra, braccio(est)).

%es12

%proviene(veicolo(b12), braccio_nord).
%proviene(veicolo(g12), braccio_ovest).
%proviene(veicolo(p12), braccio_sud).

%transita(veicolo(b12), sinistra, braccio_est).
%transita(veicolo(p12), dritto, braccio_nord).
%transita(veicolo(g12), dritto, braccio_est).
%transita(veicolo(tram)).

%deve_rispettare(veicolo(b12), segnale(dare_precedenza)).
%deve_rispettare(veicolo(p12), segnale(dare_precedenza)).

%nessun_obbligo(veicolo(g12)).
