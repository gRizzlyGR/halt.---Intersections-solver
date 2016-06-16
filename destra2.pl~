:- module(destra2, [da_destra/2]).

subito_a_destra(braccio(nord), braccio(nord_est)).
subito_a_destra(braccio(nord_est), braccio(est)).
subito_a_destra(braccio(est), braccio(sud_est)).
subito_a_destra(braccio(sud_est), braccio(sud)).
subito_a_destra(braccio(sud), braccio(sud_ovest)).
subito_a_destra(braccio(sud_ovest), braccio(ovest)).
subito_a_destra(braccio(ovest), braccio(nord_ovest)).
subito_a_destra(braccio(nord_ovest), braccio(nord)).


destra(Braccio1, Braccio2) :-
	subito_a_destra(Braccio1, Braccio2).

destra(Braccio1, Braccio2) :-
	subito_a_destra(Braccio1, BraccioIntermedio),
	subito_a_destra(BraccioIntermedio, Braccio2).


destra(Braccio1, Braccio2) :-
	subito_a_destra(Braccio1, BraccioIntermedio1),
	subito_a_destra(BraccioIntermedio1, BraccioIntermedio2),
	subito_a_destra(BraccioIntermedio2, Braccio2).

da_destra(V1, V2) :-
	proviene(V1, BraccioV1),
	proviene(V2, BraccioV2),
	destra(BraccioV1, BraccioV2).


