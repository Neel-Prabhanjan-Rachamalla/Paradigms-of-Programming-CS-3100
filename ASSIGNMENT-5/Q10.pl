len([],0) :- !.
len([_|T],N) :- len(T,M) , N is M+1 , !.

append([],Q,Q).
append([H | P], Q, [H | R]) :- append(P, Q, R).

prefix(X,Z) :- append(X,Y,Z) , len(X,M) , len(Z,N) , M is div(N,2).
suffix(Y,Z) :- append(X,Y,Z) , len(Y,M) , len(Z,N) , M is N-div(N,2).

partition([],[],[]) :- !.
partition([H],[H],[]) :- !.
partition(L,P,S) :- prefix(P,L) , suffix(S,L) , !.

mergesort([],[]) :- !.
mergesort([H],[H]) :- !.
mergesort(L,SL) :- partition(L,P,S) , mergesort(P,SP) , mergesort(S,SS) , merge(SP,SS,SL) , !.
mergesort([A,B|X],[A|Y]) :- A=<B , !.