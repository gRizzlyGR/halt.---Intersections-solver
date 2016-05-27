:- ['incroci.pl'].
%:- ['prontuario.pl'].
:- ['precedenze.pl'].
%:- use_module(msg).

solve :-
	circolazione1,
	circolazione2,
%	time(circolazione1),
%	time(circolazione2),
	fail.

%Fail driven loop
solve.
