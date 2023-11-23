append([],Q,Q) :- !.
append([H|P],Q,[H|R]) :- append(P,Q,R) , !.

len([],0,H) :- !.
len([H|T],N,H) :- len(T,M,H) , N is M+1 , !.

hpack([],X,Y,[Y]) :- !.
hpack([H|T],H,Y,Z) :- append([H],Y,A) , hpack(T,H,A,Z) , !.
hpack([H|T],X,Y,Z) :- pack([H|T],B) , append([Y],B,Z) , !.

pack([],[]) :- !.
pack([H|T],X) :- hpack(T,H,[H],X) , !.

hencode([],[]) :- !.
hencode([H|T],[[A,B]|C]) :- len(H,N,D) , A is N , B=D , hencode(T,C) , !.

encode(X,Y) :- pack(X,Z) , hencode(Z,Y) , !.
