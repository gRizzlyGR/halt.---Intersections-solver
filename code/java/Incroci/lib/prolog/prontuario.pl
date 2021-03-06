:- dynamic segnaletica/2.

%---fig.1
%proviene(veicolo(giallo), braccio(est)).
%proviene(veicolo(blu), braccio(ovest)).
%proviene(veicolo(rosso), braccio(sud)).

%transita(veicolo(giallo), sinistra, braccio(sud)).
%transita(veicolo(blu), sinistra, braccio(nord)).
%transita(veicolo(rosso), sinistra, braccio(ovest)).

%---fig.2
%proviene(veicolo(verde), braccio(ovest)).
%proviene(veicolo(ambulanza), braccio(est)).
%proviene(veicolo(rosso), braccio(nord)).

%transita(veicolo(verde), sinistra, braccio(nord)).
%transita(veicolo(ambulanza), dritto, braccio(ovest)).
%transita(veicolo(rosso), sinistra, braccio(ovest)).

%---fig.3
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(blu), braccio(sud)).
%proviene(veicolo(rosso), braccio(est)).

%transita(veicolo(giallo), dritto, braccio(est)).
%transita(veicolo(blu), dritto, braccio(nord)).
%transita(veicolo(rosso), dritto, braccio(ovest)).

%---fig.4
%proviene(veicolo(giallo), braccio(sud)).
%proviene(veicolo(blu), braccio(nord_est)).
%proviene(veicolo(nero), braccio(sud_ovest)).
%proviene(veicolo(camion), braccio(nord_ovest)).
%proviene(veicolo(verde), braccio(nord)).
%proviene(veicolo(rosso), braccio(sud_est)).

%transita(veicolo(verde), dritto, braccio(sud)).
%transita(veicolo(rosso), destra, braccio(nord)).
%transita(veicolo(blu), sinistra, braccio(sud_est)).
%transita(veicolo(nero), dritto, braccio(nord)).
%transita(veicolo(camion), dritto, braccio(sud)).
%transita(veicolo(giallo), destra, braccio(sud_est)).

%---fig.5
%proviene(veicolo(giallo), braccio(sud)).
%proviene(veicolo(blu), braccio(est)).
%proviene(veicolo(blu2), braccio(est)).
%proviene(veicolo(blu3), braccio(est)).
%proviene(veicolo(verde), braccio(nord)).
%proviene(veicolo(rosso), braccio(est)).

%transita(veicolo(verde), dritto, braccio(sud)).
%transita(veicolo(rosso), sinistra, braccio(sud)).
%transita(veicolo(blu), dritto, braccio(ovest)).
%transita(veicolo(blu2), dritto, braccio(ovest)).
%transita(veicolo(blu3), dritto, braccio(ovest)).
%transita(veicolo(giallo), sinistra, braccio(ovest)).

%---fig.6
%proviene(veicolo(giallo), braccio(nord_ovest)).
%proviene(veicolo(rosso), braccio(est)).
%proviene(veicolo(blu), braccio(ovest)).

%transita(veicolo(blu), dritto, braccio(est)).
%transita(veicolo(rosso), sinistra, braccio(sud_est)).
%transita(veicolo(giallo), dritto, braccio(sud_est)).

%---fig.7
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(rosso), braccio(nord_est)).
%proviene(veicolo(blu), braccio(sud)).
%proviene(veicolo(celeste), braccio(est)).
%proviene(veicolo(verde), braccio(nord_ovest)).

%transita(veicolo(blu), dritto, braccio(nord_est)).
%transita(veicolo(rosso), dritto, braccio(ovest)).
%transita(veicolo(giallo), dritto, braccio(nord_est)).
%transita(veicolo(celeste), sinistra, braccio(sud)).
%transita(veicolo(verde), sinistra, braccio(nord_est)).

%---fig.8
%proviene(veicolo(rosso), braccio(nord_est)).
%proviene(veicolo(giallo), braccio(nord_ovest)).
%proviene(veicolo(rosa), braccio(sud)).
%proviene(veicolo(blu), braccio(ovest)).

%transita(veicolo(rosa), dritto, braccio(nord_est)).
%transita(veicolo(blu), dritto, braccio(nord_est)).
%transita(veicolo(rosso), dritto, braccio(ovest)).
%transita(veicolo(giallo), dritto, braccio(sud)).

%---fig.9
%proviene(veicolo(giallo), braccio(est)).
%proviene(veicolo(motocarro), braccio(sud)).
%proviene(veicolo(rosso), braccio(ovest)).

%transita(veicolo(giallo), sinistra, braccio(sud)).
%transita(veicolo(motocarro), dritto, braccio(nord)).
%transita(veicolo(rosso), sinistra, braccio(nord)).

%segnaletica(braccio(sud), segnale(dare_precedenza)).

%---fig.10
%proviene(veicolo(verde), braccio(nord)).
%proviene(veicolo(giallo), braccio(sud)).
%proviene(veicolo(autopompa), braccio(est)).
%proviene(veicolo(blu), braccio(nord)).

%transita(veicolo(autopompa), dritto, braccio(ovest)).
%transita(veicolo(blu), dritto, braccio(sud)).
%transita(veicolo(verde), sinistra, braccio(est)).
%transita(veicolo(giallo), sinistra, braccio(ovest)).

%---fig.11
%proviene(veicolo(tram), braccio(sud)).
%proviene(veicolo(ambulanza), braccio(nord_ovest)).
%proviene(veicolo(moto), braccio(nord_est)).
%proviene(veicolo(blu), braccio(sud_est)).

%transita(veicolo(ambulanza), sinistra, braccio(nord)).
%transita(veicolo(blu), dritto, braccio(nord_ovest)).
%transita(veicolo(tram), dritto, braccio(nord)).
%transita(veicolo(moto), dritto, braccio(nord_ovest)).

%---fig.12
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(blu), braccio(est)).
%proviene(veicolo(rosso), braccio(sud)).

%transita(veicolo(giallo), sinistra, braccio(nord)).
%transita(veicolo(blu), sinistra, braccio(sud)).
%transita(veicolo(rosso), dritto, braccio(nord)).


%---fig.13
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(rosso), braccio(sud)).
%proviene(veicolo(blu), braccio(est)).

%transita(veicolo(blu), sinistra, braccio(sud)).
%transita(veicolo(rosso), dritto, braccio(nord)).
%transita(veicolo(giallo), dritto, braccio(est)).

%---fig.14
%proviene(veicolo(tram), braccio(sud)).
%proviene(veicolo(camion), braccio(nord)).
%proviene(veicolo(moto), braccio(ovest)).
%proviene(veicolo(blu), braccio(est)).

%transita(veicolo(camion), dritto, braccio(sud)).
%transita(veicolo(blu), dritto, braccio(ovest)).
%transita(veicolo(tram), dritto, braccio(nord)).
%transita(veicolo(moto), dritto, braccio(est)).

%---fig.15
%proviene(veicolo(tram), braccio(nord)).
%proviene(veicolo(rosso), braccio(ovest).
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(blu), braccio(sud)).

%transita(veicolo(rosso), sinistra, braccio(nord)).
%transita(veicolo(blu), sinistra, braccio(ovest)).
%transita(veicolo(tram), dritto, braccio(sud)).
%transita(veicolo(giallo), destra, braccio(sud)).


%---fig.16
%proviene(veicolo(verde), braccio(nord)).
%proviene(veicolo(rosso), braccio(nord).
%proviene(veicolo(giallo), braccio(est)).
%proviene(veicolo(blu), braccio(ovest)).

%transita(veicolo(rosso), dritto, braccio(sud)).
%transita(veicolo(blu), sinistra, braccio(nord)).
%transita(veicolo(verde), sinistra, braccio(est)).
%transita(veicolo(giallo), sinistra, braccio(sud)).


%---fig.17
%proviene(veicolo(blu), braccio(sud)).
%proviene(veicolo(motocarro), braccio(ovest)).
%proviene(veicolo(rosso), braccio(est).

%transita(veicolo(blu), sinistra, braccio(ovest)).
%transita(veicolo(motocarro), dritto, braccio(est)).
%transita(veicolo(rosso), sinistra, braccio(sud)).


%---fig.18
%proviene(veicolo(celeste), braccio(sud_est)).
%proviene(veicolo(giallo), braccio(sud_ovest)).
%proviene(veicolo(rosso), braccio(ovest)).
%proviene(veicolo(motocarro), braccio(nord)).
%proviene(veicolo(blu), braccio(nord_est)).

%transita(veicolo(rosso), dritto, braccio(nord_est)).
%transita(veicolo(motocarro), dritto, braccio(sud_ovest)).
%transita(veicolo(blu), dritto, braccio(ovest)).
%transita(veicolo(celeste), sinistra, braccio(sud_ovest)).
%transita(veicolo(giallo), destra, braccio(sud_est)).


%---fig.19
%proviene(veicolo(verde), braccio(est)).
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(autocarro), braccio(nord_ovest)).
%proviene(veicolo(blu), braccio(nord_est)).

%transita(veicolo(autocarro), sinistra, braccio(est)).
%transita(veicolo(blu), destra, braccio(ovest)).
%transita(veicolo(verde), dritto, braccio(ovest)).
%transita(veicolo(giallo), dritto, braccio(est)).

%---fig.20
%proviene(veicolo(celeste), braccio(nord_est)).
%proviene(veicolo(giallo), braccio(sud_est)).
%proviene(veicolo(rosso), braccio(nord_ovest)).
%proviene(veicolo(moto), braccio(sud_ovest)).

%transita(veicolo(rosso), dritto, braccio(sud_est)).
%transita(veicolo(moto), destra, braccio(sud_ovest)).
%transita(veicolo(celeste), dritto, braccio(sud_ovest)).
%transita(veicolo(giallo), sinistra, braccio(sud_ovest)).


%---fig.21
%proviene(veicolo(blu), braccio(sud)).
%proviene(veicolo(tram), braccio(ovest)).
%proviene(veicolo(camion), braccio(ovest).

%transita(veicolo(blu), dritto, braccio(nord)).
%transita(veicolo(tram), dritto, braccio(est)).
%transita(veicolo(camion), dritto, braccio(est)).


%---fig.22
%proviene(veicolo(blu), braccio(ovest)).
%proviene(veicolo(giallo), braccio(est)).
%proviene(veicolo(rosso), braccio(sud).

%transita(veicolo(blu), dritto, braccio(est)).
%transita(veicolo(giallo), dritto, braccio(ovest)).
%transita(veicolo(rosso), sinistra, braccio(ovest)).


%---fig.23
%proviene(veicolo(verde), braccio(nord_est)).
%proviene(veicolo(rosso), braccio(est).
%proviene(veicolo(giallo), braccio(sud_est)).
%proviene(veicolo(blu), braccio(ovest)).

%transita(veicolo(rosso), dritto, braccio(ovest)).
%transita(veicolo(blu), dritto, braccio(est)).
%transita(veicolo(verde), destra, braccio(ovest)).
%transita(veicolo(giallo), sinistra, braccio(ovest)).


%---fig.24
%proviene(veicolo(verde), braccio(nord_ovest)).
%proviene(veicolo(giallo), braccio(sud_est)).
%proviene(veicolo(autocarro), braccio(sud_ovest)).
%proviene(veicolo(blu), braccio(nord)).

%transita(veicolo(autocarro), destra, braccio(sud_est)).
%transita(veicolo(blu), dritto, braccio(sud_ovest)).
%transita(veicolo(verde), dritto, braccio(sud_est)).
%transita(veicolo(giallo), dritto, braccio(nord)).


%---fig.25
%proviene(veicolo(giallo), braccio(ovest)).
%proviene(veicolo(blu), braccio(sud)).
%proviene(veicolo(rosso), braccio(est)).

%transita(veicolo(giallo), destra, braccio(sud)).
%transita(veicolo(blu), sinistra, braccio(ovest)).
%transita(veicolo(rosso), sinistra, braccio(sud)).

%---fig.26
%proviene(veicolo(blu), braccio(ovest)).
%proviene(veicolo(tram), braccio(est)).
%proviene(veicolo(rosso), braccio(est).

%transita(veicolo(blu), dritto, braccio(est)).
%transita(veicolo(tram), dritto, braccio(ovest)).
%transita(veicolo(rosso), sinistra, braccio(sud)).

%---fig.27
%proviene(veicolo(giallo), braccio(sud_est)).
%proviene(veicolo(autobus), braccio(nord_est)).
%proviene(veicolo(camion), braccio(nord_ovest).

%transita(veicolo(giallo), sinistra, braccio(sud_ovest)).
%transita(veicolo(autobus), dritto, braccio(sud_ovest)).
%transita(veicolo(camion), dritto, braccio(sud_est)).

%---fig.28
%proviene(veicolo(giallo), braccio(est)).
%proviene(veicolo(autobus), braccio(est)).
%proviene(veicolo(moto), braccio(nord)).

%transita(veicolo(giallo), sinistra, braccio(sud)).
%transita(veicolo(autobus), dritto, braccio(ovest)).
%transita(veicolo(moto), sinistra, braccio(est)).


%---fig.29
%proviene(veicolo(giallo), braccio(sud_ovest)).
%proviene(veicolo(rimorchio), braccio(nord_ovest)).
%proviene(veicolo(blu), braccio(est).

%transita(veicolo(giallo), dritto, braccio(est)).
%transita(veicolo(rimorchio), dritto, braccio(est)).
%transita(veicolo(blu), dritto, braccio(ovest)).


%---fig.30
%proviene(veicolo(giallo), braccio(nord_ovest)).
%proviene(veicolo(blu), braccio(sud_ovest)).
%proviene(veicolo(rosso), braccio(est).

%transita(veicolo(giallo), dritto, braccio(est)).
%transita(veicolo(blu), sinistra, braccio(nord_ovest)).
%transita(veicolo(rosso), dritto, braccio(nord_est)).

%---fig.31
%proviene(veicolo(verde), braccio(ovest)).
%proviene(veicolo(nero), braccio(sud)).
%proviene(veicolo(rosso), braccio(est)).
%proviene(veicolo(blu), braccio(nord)).

%transita(veicolo(rosso), sinistra, braccio(sud)).
%transita(veicolo(blu), sinistra, braccio(est)).
%transita(veicolo(verde), dritto, braccio(est)).
%transita(veicolo(nero), dritto, braccio(nord)).

%segnaletica(braccio(est), segnale(dare_precedenza)).
%segnaletica(braccio(ovest), segnale(dare_precedenza)).

%---fig.38
%proviene(veicolo(giallo), braccio(nord)).
%proviene(veicolo(rosso), braccio(nord)).
%proviene(veicolo(blu), braccio(ovest)).

%transita(veicolo(blu), sinistra, braccio(nord)).
%transita(veicolo(rosso), sinistra, braccio(est)).
%transita(veicolo(giallo), dritto, braccio(sud)).

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


%---fig.49
proviene(veicolo(rosso), braccio(nord_est)).
proviene(veicolo(giallo), braccio(est)).
proviene(veicolo(blu), braccio(nord_ovest)).

transita(veicolo(rosso), sinistra, braccio(est)).
transita(veicolo(blu), dritto, braccio(sud)).
transita(veicolo(giallo), dritto, braccio(sud_ovest)).

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

%---fig.57
%proviene(veicolo(tram), braccio(est)).
%proviene(veicolo(rosso), braccio(ovest)).
%proviene(veicolo(nero), braccio(sud)).
%proviene(veicolo(blu), braccio(nord)).

%transita(veicolo(rosso), dritto, braccio(est)).
%transita(veicolo(blu), sinistra, braccio(est)).
%transita(veicolo(nero), dritto, braccio(nord)).
%transita(veicolo(tram), sinistra, braccio(sud)).

%segnaletica(braccio(nord), segnale(dare_precedenza)).
%segnaletica(braccio(sud), segnale(dare_precedenza)).
