:-module(destra, [da_destra/2]).

%Raccolgo le tratte coperte dai veicoli sotto i vari punti cardinali
da_nord(veicolo(X)) :-
	proviene(veicolo(X), braccio(nord));
	proviene(veicolo(X), braccio(nord_ovest));
	proviene(veicolo(X), braccio(nord_est)).

da_sud(veicolo(X)) :-
	proviene(veicolo(X), braccio(sud));
	proviene(veicolo(X), braccio(sud_est));
	proviene(veicolo(X), braccio(sud_ovest)).

da_est(veicolo(X)) :-
	proviene(veicolo(X), braccio(est));
	proviene(veicolo(X), braccio(sud_est));
	proviene(veicolo(X), braccio(nord_est)).

da_ovest(veicolo(X)) :-
	proviene(veicolo(X), braccio(ovest));
	proviene(veicolo(X), braccio(sud_ovest));
	proviene(veicolo(X), braccio(nord_ovest)).

%Determino la posizione dei veicoli in base ai punti cardinali
da_destra(veicolo(X), veicolo(Y)) :-
	da_nord(veicolo(X)),
	da_est(veicolo(Y)).

da_destra(veicolo(X), veicolo(Y)) :-
	da_est(veicolo(X)),
	da_sud(veicolo(Y)).

da_destra(veicolo(X), veicolo(Y)) :-
	da_sud(veicolo(X)),
	da_ovest(veicolo(Y)).

da_destra(veicolo(X), veicolo(Y)) :-
	da_ovest(veicolo(X)),
	da_nord(veicolo(Y)).
