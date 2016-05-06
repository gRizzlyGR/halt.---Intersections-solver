:- module(opposti, [opposto/2]).

%Nord
di_fronte(braccio(nord), braccio(sud)).
di_fronte(braccio(nord), braccio(sud_est)).
di_fronte(braccio(nord), braccio(sud_ovest)).

%Sud
di_fronte(braccio(sud), braccio(nord)).
di_fronte(braccio(sud), braccio(nord_est)).
di_fronte(braccio(sud), braccio(nord_ovest)).

%Est
di_fronte(braccio(est), braccio(ovest)).
di_fronte(braccio(est), braccio(sud_ovest)).
di_fronte(braccio(est), braccio(nord_ovest)).

%Ovest
di_fronte(braccio(ovest), braccio(est)).
di_fronte(braccio(ovest), braccio(sud_est)).
di_fronte(braccio(ovest), braccio(nord_est)).

opposto(braccio(X), braccio(Y)) :-
	di_fronte(braccio(X), braccio(Y)).

opposto(braccio(X), braccio(Y)) :-
	di_fronte(braccio(Y), braccio(X)).
