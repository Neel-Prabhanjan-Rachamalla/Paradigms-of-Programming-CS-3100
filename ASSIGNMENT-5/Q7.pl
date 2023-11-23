natural_number(S) :- S=0 , !.
natural_number(s(S)) :- natural_number(S) , !.

of_int(0,0) :- !.
of_int(N,s(X)) :- N>0 , M is N-1 , of_int(M,X) , !.

to_int(0,0) :- !.
to_int(s(X),N) :- to_int(X,M) , N is M+1 , N>0 , !.

sub(X,0,X) :- natural_number(X) , !.
sub(s(X),s(Y),Z) :- sub(X,Y,Z) , !.