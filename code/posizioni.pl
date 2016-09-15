:- module(posizioni, [
			svolta_a_u/2,
			transitano_stesso_braccio/2,
			entrambi_dritto/2,
			entrambi_a_sinistra/4,
			uno_a_sinistra/4,
			nel_braccio_dell_altro/2,
			dove_vado_uguale_dove_vieni/2
			]).

:- use_module(gestore_kb).
:- use_module(destra).

% Il braccio di arrivo di un veicolo è a destra del braccio di provenizenza di un altro.
% Questo può comportare il caso in cui un veicolo proveniente da destra ma che da la precedenza ad un altro
% si diriga in un braccio svoltando ad U.
svolta_a_u(V1, V2) :-
	transita(V1, _, Arrivo),
	proviene(V2, Partenza),
	destra_lasca(Arrivo, Partenza).

transitano_stesso_braccio(V1, V2) :-
	transita(V1, _, StessoBraccio),
	transita(V2, _, StessoBraccio).

% Copre il caso in cui almeno uno dei due veicoli va nel braccio 
% di provienenza dell'altro, quando proseguono dritto.
entrambi_dritto(V1, V2) :-
	transita(V1, dritto, _),
	transita(V2, dritto, _),
	\+ nel_braccio_dell_altro(V1, V2).
%	\+ opposto(BraccioV1, BraccioV2).

% Entrambi i veicoli vanno a sinistra.
entrambi_a_sinistra(V1, V2, BraccioV1, BraccioV2) :-
	transita(V1, sinistra, BraccioV1),
	transita(V2, sinistra, BraccioV2).

% Un veicolo va a sinistra.
uno_a_sinistra(V1, V2, BraccioV1, BraccioV2) :-
	transita(V1, sinistra, BraccioV1),
	transita(V2, _, BraccioV2).

uno_a_sinistra(V1, V2, BraccioV1, BraccioV2) :-
	transita(V1, _, BraccioV1),
	transita(V2, sinistra, BraccioV2).

% Un veicolo si dirige nel braccio di provenienza dell'altro
nel_braccio_dell_altro(V1, V2) :-
	proviene(V1, BraccioV1),
	transita(V2, _, BraccioV1).

nel_braccio_dell_altro(V1, V2) :-
	proviene(V2, BraccioV2),
	transita(V1, _, BraccioV2).

% I veicoli vanno reciprocamente nei bracci di provenienza dell'altro
dove_vado_uguale_dove_vieni(V1, V2) :-
	proviene(V1, BraccioV1),
	proviene(V2, BraccioV2),
	transita(V1, _, BraccioV2),
	transita(V2, _, BraccioV1).
