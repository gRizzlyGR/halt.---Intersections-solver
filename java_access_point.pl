:- module(java_access_point, [process_list/2]).

process_list([],[]). 
process_list([H|T], [string(At) | NewT]) :- 
	term_to_atom(H, At), process_list(T, NewT).
