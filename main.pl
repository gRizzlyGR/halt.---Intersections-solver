:- ['incroci.pl'].
:- ['precedenze.pl'].

start :-
	primo(veicolo(_)),
	fail.

%Fail driven loop
start.
