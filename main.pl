
%:- ['incroci.pl'].
%:- ['prontuario.pl'].
:- ['precedenze.pl']. %Carico per test, onde evitare di scrivere il nome del modulo ogni volta
:- use_module(circolazione).
%:- ['circolazione.pl'].
:- use_module(interfaccia).
:- use_module(gestore_kb).

solve :-
	circolano,
%	time(circolano),
	fail.

%Fail driven loop
solve.


start :-
	init.
