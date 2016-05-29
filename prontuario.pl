:- dynamic segnaletica/2.

%---fig.5
%proviene(veicolo(giallo), braccio(sud)).
%proviene(veicolo(blu), braccio(est)).
%proviene(veicolo(verde), braccio(nord)).
%proviene(veicolo(rosso), braccio(est)).

%transita(veicolo(verde), dritto, braccio(sud)).
%transita(veicolo(rosso), sinistra, braccio(sud)).
%transita(veicolo(blu), dritto, braccio(ovest)).
%transita(veicolo(giallo), sinistra, braccio(ovest)).

%---fig.6
%proviene(veicolo(giallo), braccio(nord_ovest)).
%proviene(veicolo(rosso), braccio(est)).
%proviene(veicolo(blu), braccio(ovest)).

%transita(veicolo(blu), dritto, braccio(est)).
%transita(veicolo(rosso), sinistra, braccio(sud_ovest)).
%transita(veicolo(giallo), dritto, braccio(sud_ovest)).


%---fig.18
%proviene(veicolo(c), braccio(sud_est)).
%proviene(veicolo(g), braccio(sud_ovest)).
%proviene(veicolo(r), braccio(ovest)).
%proviene(veicolo(v), braccio(nord)).
%proviene(veicolo(b), braccio(nord_est)).

%transita(veicolo(r), dritto, braccio(nord_est)).
%transita(veicolo(v), dritto, braccio(sud_ovest)).
%transita(veicolo(b), dritto, braccio(ovest)).
%transita(veicolo(c), sinistra, braccio(sud_ovest)).
%transita(veicolo(g), destra, braccio(sud_est)).

%---fig.20
%proviene(veicolo(verde), braccio(est)).
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(autocarro), braccio(nord_ovest)).
%proviene(veicolo(blu), braccio(nord_est)).

%transita(veicolo(autocarro), sinistra, braccio(est)).
%transita(veicolo(blu), destra, braccio(ovest)).
%transita(veicolo(verde), dritto, braccio(ovest)).
%transita(veicolo(giallo), dritto, braccio(est)).

%---fig.38
proviene(veicolo(giallo), braccio(nord)).
proviene(veicolo(rosso), braccio(nord)).
proviene(veicolo(blu), braccio(ovest)).

transita(veicolo(blu), sinistra, braccio(nord)).
transita(veicolo(rosso), sinistra, braccio(est)).
transita(veicolo(giallo), dritto, braccio(sud)).

%---fig.41
%proviene(veicolo(nero), braccio(ovest)).
%proviene(veicolo(rosso), braccio(est)).
%proviene(veicolo(verde), braccio(sud)).

%transita(veicolo(verde), sinistra, braccio(ovest)).
%transita(veicolo(nero), sinistra, braccio(nord)).
%transita(veicolo(rosso), dritto, braccio(ovest)).

%segnaletica(braccio(est), segnale(dare_precedenza)).
%segnaletica(braccio(ovest), segnale(dare_precedenza)).

%---fig.43
%proviene(veicolo(rosso), braccio(nord_ovest)).
%proviene(veicolo(giallo), braccio(sud_ovest)).
%proviene(veicolo(blu), braccio(sud_est)).

%transita(veicolo(rosso), dritto, braccio(sud_est)).
%transita(veicolo(blu), sinistra, braccio(sud_ovest)).
%transita(veicolo(giallo), destra, braccio(sud_est)).

%---fig.53
%proviene(veicolo(rosso), braccio(nord)).
%proviene(veicolo(nero), braccio(sud_ovest)).
%proviene(veicolo(verde), braccio(sud_est)).
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(blu), braccio(est)).

%transita(veicolo(rosso), dritto, braccio(sud_ovest)).
%transita(veicolo(verde), sinistra, braccio(sud_ovest)).
%transita(veicolo(blu), sinistra, braccio(sud_ovest)).
%transita(veicolo(nero), destra, braccio(est)).
%transita(veicolo(giallo), sinistra, braccio(nord)).
