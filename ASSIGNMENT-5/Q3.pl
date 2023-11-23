natural_number(S) :- S=0 , !.
natural_number(s(S)) :- natural_number(S) , !.
