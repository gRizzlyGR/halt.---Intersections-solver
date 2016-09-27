:- module(analisi, [analizza_veicolo/1, analizza_tutti/0]).

:- use_module(precedenze).
:- use_module(msg).
:- use_module(utils).

analizza(veicolo(V)) :-
	analizza_veicolo(V).

analizza_veicolo(V) :-
	Veicolo = veicolo(V),
	proviene(Veicolo, _),
	recupera_preceduti(Veicolo, L1),
	recupera_precedenti(Veicolo, L2),
	recupera_simultanei(Veicolo, L3),
	msg:preceduti(V, L1),
	msg:precedenti(V, L2),
	msg:simultanei(V, L3).

analizza_veicolo(Veicolo) :-
	utils:non_esiste(veicolo(Veicolo)),
	msg:non_esiste.
	

recupera_preceduti(Veicolo, L) :-
	findall(Preceduto, precede(Veicolo, Preceduto), Tmp),
	sort(Tmp, L).

recupera_precedenti(Veicolo, L) :-
	findall(Precedente, precede(Precedente, Veicolo), Tmp),
	sort(Tmp, L).

recupera_simultanei(Veicolo, L) :-
	findall(Simultaneo, simultaneo(Veicolo, Simultaneo), Tmp),
	sort(Tmp, L).

analizza_tutti :-
	findall(V, proviene(V, _), L),
	itera(L).

itera([V | T]) :-
	analizza(V), nl,
	itera(T).

itera([]).
