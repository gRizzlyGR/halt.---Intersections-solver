:- module(deadlock, [
				attesa_circolare/1,
				va_a_sinistra/3
				]).

:- use_module(precedenze).
:- use_module(gestore_kb).
:- use_module(utils).

% Può capitare che i veicoli nell'incrocio debbano dare la precedenza ad un veicolo e averla da un altro, in modo circolare;
% si viene così a creare una situazione di stallo che viene risolta quando un veicolo che transita a sinistra si porta al centro
% dell'incrocio così da permettere agli altri di transitare, secondo le regole standard. Il veicolo al centro passerà per ultimo.

attesa_circolare(Veicoli) :-
	setof(V, non_il_primo(V), Veicoli),
	almeno_tre(Veicoli),
	stallo(Veicoli, Veicoli).


% Vengono considerati solo i veicoli in stallo. Ce ne potrebbe essere un altro che non è coinvolto e passa prima.
non_il_primo(Veicolo) :-
	proviene(Veicolo, _),
	\+ primo(Veicolo),
	\+ ultimo(Veicolo).


stallo([H|T], Veicoli) :-
	precede(Precede, H),
	member(Precede, Veicoli),
	stallo(T, Veicoli).

stallo([], _).


%stallo([H|T], Acc, Veicoli) :-
%	precede(Precede, H),
%	member(Precede, Veicoli),
%	stallo(T, [Precede | Acc], Veicoli).

%stallo([H|T], Acc, Veicoli) :-
%	precede(H, Preceduto),
%%	\+ ultimo(Preceduto),
%	member(Preceduto, Veicoli),
%	\+ member(Preceduto, Acc),
%	stallo(T, [Preceduto | Acc], Veicoli).

%stallo([], _, _).


% Trovo il primo veicolo che va a sinistra e lo rimuovo dalla lista
va_a_sinistra(V, Altri, Veicoli) :-
	transita(V, sinistra, _),
	precede(V, _),
	utils:canc(V, Veicoli, Altri).
	

% Per avere uno stallo ci devono essere almeno 3 veicoli.
almeno_tre(Veicoli) :-
	length(Veicoli, N),
	N > 2.	
