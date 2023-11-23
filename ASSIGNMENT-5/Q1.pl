append([],Q,Q).
append([H|P],Q,[H|R]) :- append(P,Q,R).

hreverse([],Q,Q) :- !.
hreverse([H|P],Q,R) :- append([H],Q,S) , hreverse(P,S,R) , !.

reverse(X,Y) :- hreverse(X,[],Y).
