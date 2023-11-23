append([],Q,Q).
append([H | P], Q, [H | R]) :- append(P, Q, R).

my_flatten([],[]) :- !.
my_flatten([[A|B]|T],Z) :- append([A|B],T,S) , my_flatten(S,Z) , !.
my_flatten([X|T],[X|Y]) :- my_flatten(T,Y) , !.