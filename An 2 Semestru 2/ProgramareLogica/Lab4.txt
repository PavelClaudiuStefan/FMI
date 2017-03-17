trans_a_b([],[]).
trans_a_b([a|InputTail],[b|OutputTail]) :- trans_a_b(InputTail,OutputTail).

element_of(X,[X|_]).
element_of(X,[_|Tail]) :- element_of(X,Tail).

% ex 1
all_a([]).
all_a([a | X]) :- all_a(X).

%ex 2
list_length([], 0).
list_length([_|Tail], R) :- list_length(Tail, P), R is P+1.

%ex 3
scalarMult(0,[],[]).
scalarMult(X, [Y|Tail], [R|T]) :- scalarMult(X, Tail, T), R is X*Y.

%ex 4
dot([],[],0).
dot([A|B], [X|Y], R) :- dot(B, Y, P), R is A*X + P.

%ex 5
max([], 0).
max([X|Tail], X) :- max(Tail, P), P < X. 
max([X|Tail], P) :- max(Tail, P), P >= X.


%ex 6
first([X|Tail], X, Tail). 

last(X,[X]).
last(X,[_|Z]) :- last(X,Z).


last(Es, L, R) :- append(R, [L], Es). 

palindrom([]).
palindrom([_]).
palindrom(Pal) :-
  first(Pal, First, Tail), last(Tail, First, Y), palindrom(Y).
