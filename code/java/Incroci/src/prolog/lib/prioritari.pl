:- module(prioritari, [
			prioritario/1, 
			alta_priorita/1,
			media_priorita/1]).

media_priorita(veicolo(tram)).
alta_priorita(veicolo(ambulanza)).
alta_priorita(veicolo(autopompa)).

prioritario(P) :-
	media_priorita(P).

prioritario(P) :-
	alta_priorita(P).	
