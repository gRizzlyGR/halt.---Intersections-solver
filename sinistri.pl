%Sinistri --Da rivedere
sinistro(veicolo(X), veicolo(Y)) :-
	scontro(veicolo(X), veicolo(Y)),
	X \== Y.

sinistro(veicolo(X), veicolo(Y)) :-
	scontro(veicolo(Y), veicolo(X)),
	X \== Y.

scontro(veicolo(X), veicolo(Y)) :-
	precedenza(veicolo(X), veicolo(Y)),
	procede(veicolo(X), sinistra),
	procede(veicolo(Y), dritto).

scontro(veicolo(X), veicolo(Y)) :-
	precedenza(veicolo(X), veicolo(Y)),
	procede(veicolo(X), destra),
	procede(veicolo(Y), dritto).

scontro(veicolo(X), veicolo(Y)) :-
	procede(veicolo(X), dritto),
	procede(veicolo(Y), dritto).
