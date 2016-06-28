:- module(attesa_circolare, [
				attesa_circolare/1,
				va_a_sinistra/3
				]).

:- use_module(precedenze).
:- use_module(gestore_kb).

% Può capitare che i veicoli nell'incrocio debbano dare la precedenza ad un veicolo e averla da un altro, in modo circolare;
% si viene così a creare una situazione di stallo che viene risolta quando un veicolo che transita a sinistra si porta al centro
% dell'incrocio così da permettere agli altri di transitare, secondo le regole standard. Il veicolo al centro passerà per ultimo.

attesa_circolare(Veicoli) :-
	setof(V, non_il_primo(V), Veicoli),
	almeno_tre(Veicoli),
	stallo(Veicoli, []).


% Vengono considerati solo i veicoli in stallo. Ce ne potrebbe essere un altro che non è coinvolto e passa prima.
non_il_primo(Veicolo) :-
	proviene(Veicolo, _),
	\+ primo(Veicolo),
	\+ ultimo(Veicolo).

stallo([H|T], Acc) :-
	precede(H, Preceduto),
	\+ member(Preceduto, Acc),
	stallo(T, [Preceduto | Acc]).

stallo([], _).


va_a_sinistra(V, Altri, [V | Altri]) :-
	transita(V, sinistra, _).

va_a_sinistra(V, Altri, Veicoli) :-
	acc_va_a_sinistra(V, [], Altri, Veicoli).

acc_va_a_sinistra(V, Altri, Altri, [V]) :-
	transita(V, sinistra, _).	

acc_va_a_sinistra(V, Acc, Altri, [Altro | T]) :-
	acc_va_a_sinistra(V, [Altro | Acc], Altri, T).

% Per avere uno stallo ci devono essere almeno 3 veicoli.
almeno_tre(Veicoli) :-
	length(Veicoli, N),
	N > 2.	
