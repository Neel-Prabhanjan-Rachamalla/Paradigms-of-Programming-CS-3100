len([],0) :- !.
len([H|T],N) :- len(T,M) , N is M+1 , !.

part([],Y,[],[]) :- !.
part([X|Xs],Y,[X|Ls],Rs) :- len(X,A) , len(Y,B) , A =< B, part(Xs,Y,Ls,Rs) , !.
part([X|Xs],Y,Ls,[X|Rs]) :- len(X,A) , len(Y,B) , A > B, part(Xs,Y,Ls,Rs) , !.

quicksort([H|T],SL) :- part(T,H,Ls,Rs) , quicksort(Ls,SLs) , quicksort(Rs,SRs) , append(SLs,[H|SRs],SL) , !.
quicksort([],[]) :- !.

lsort([],[]) :- !.
lsort(X,L) :- quicksort(X,L) , !.
