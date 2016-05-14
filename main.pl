:- ['incroci.pl'].
:- ['precedenze.pl'].

start :-
	primo(veicolo(X)),
	write('Il primo a passare è il veicolo '), write(X), write('.'), nl,
	fail.

%Fail driven loop
start.
