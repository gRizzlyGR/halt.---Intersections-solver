
%:- ['incroci.pl'].
:- ['prontuario.pl'].
:- ['precedenze.pl']. %Carico per test, onde evitare di scrivere il nome del modulo ogni volta
:- use_module(circolazione).

solve :-
	circolano1,
	circolano2,
%	time(circolano1),
%	time(circolano2),
	fail.

%Fail driven loop
solve.
