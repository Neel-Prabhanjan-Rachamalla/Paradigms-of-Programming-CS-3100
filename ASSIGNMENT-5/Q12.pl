append([],Q,Q).
append([H|P],Q,[H|R]) :- append(P,Q,R).

hpack([],X,Y,[Y]) :- !.
hpack([H|T],H,Y,Z) :- append([H],Y,A) , hpack(T,H,A,Z) , !.
hpack([H|T],X,Y,Z) :- pack([H|T],B) , append([Y],B,Z) , !.

pack([],[]) :- !.
pack([H|T],X) :- hpack(T,H,[H],X) , !.