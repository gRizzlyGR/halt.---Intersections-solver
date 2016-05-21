:- ['incroci.pl'].
:- ['precedenze.pl'].
%:- use_module(msg).

solve :-
	primo(_),
%	msg:primo_a_passare(A),
	next(_),
	ultimo(_),
%	msg:prossimo_a_passare(B),
	fail.

%Fail driven loop
solve.
