:- module(destra2, [da_destra/2]).

:- use_module(adiacenza).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(nord)),
	proviene(veicolo(Y), braccio(nord_est)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(nord_est)),
	proviene(veicolo(Y), braccio(est)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(est)),
	proviene(veicolo(Y), braccio(sud_est)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(sud_est)),
	proviene(veicolo(Y), braccio(sud)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(sud)),
	proviene(veicolo(Y), braccio(sud_ovest)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(sud_ovest)),
	proviene(veicolo(Y), braccio(ovest)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(ovest)),
	proviene(veicolo(Y), braccio(nord_ovest)).

da_destra(veicolo(X), veicolo(Y)) :-
	proviene(veicolo(X), braccio(nord_ovest)),
	proviene(veicolo(Y), braccio(nord)).

%da_destra(veicolo(X), veicolo(Y)) :-
%	proviene(veicolo(X), BraccioX),
%	proviene(veicolo(Y), BraccioY),
	
