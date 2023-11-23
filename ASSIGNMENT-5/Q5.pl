natural_number(S) :- S=0 , !.
natural_number(s(S)) :- natural_number(S) , !.

plus(0,A,A) :- natural_number(A) , !.
plus(s(A),B,s(C)) :- plus(A,B,C) , !.

mult(X,0,0) :- !.
mult(X,s(Y),Z) :- mult(X,Y,W) , plus(X,W,Z) , !.