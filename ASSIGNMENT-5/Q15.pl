prime_factors(1,[]) :- !.
prime_factors(N,[H|T]) :- prime_factor(N,H) , M is N/H , prime_factors(M,T) , !.

hprime(N,A,A) :- 0 is N mod A , !.
hprime(N,A,B) :- A<N , 0 is N mod A , M is N/A , hprime(M,A,B) , !.
hprime(N,A,B) :- C is A+1 , hprime(N,C,B) , !.

prime_factor(N,H) :- hprime(N,2,H) , !.