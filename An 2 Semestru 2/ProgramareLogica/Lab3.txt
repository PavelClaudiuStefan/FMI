% Maze

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X, Y) :- connected(X, Y).
path(X, Y) :- path(X, Z), connected(Z, Y).

% path(5, 10).
% path(1, X).
% path(X, 13).


% Travel
% Valmont CAR saarbrucken TRAIN frankfurt PLANE bangkok PLANE auckland CAR hamilton CAR raglan

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
 
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
 
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

go(X, Y) :- byCar(X, Y).
go(X, Y) :- byTrain(X, Y).
go(X, Y) :- byPlane(X, Y).

go(X, Y, byCar) :- byCar(X, Y).
go(X, Y, byTrain) :- byTrain(X, Y).
go(X, Y, byPlane) :- byPlane(X, Y).

travel(X, Y) :- go(X, Y).
travel(X, Y) :- travel(X, Z), go(Z, Y).

travel(X, Y, Z) :- go(X, Y, Z).
travel(X, Y, Z) :- go(X, W, go(W, Y, Z)).
travel(X, Y, Z) :- travel(X, W, Z), go(W, Y, Z).
travel(X, Y, Z) :- travel(X, W, go(W, Y, Z)).






%*******************************************
% Maze

connected(1,2).
connected(3,4).
connected(5,6).
connected(7,8).
connected(9,10).
connected(12,13).
connected(13,14).
connected(15,16).
connected(17,18).
connected(19,20).
connected(4,1).
connected(6,3).
connected(4,7).
connected(6,11).
connected(14,9).
connected(11,15).
connected(16,12).
connected(14,17).
connected(16,19).

path(X, Y) :- connected(X, Y).
path(X, Y) :- path(X, Z), connected(Z, Y).

% path(5, 10).
% path(1, X).
% path(X, 13).







% Travel
% Valmont CAR saarbrucken TRAIN frankfurt PLANE bangkok PLANE auckland CAR hamilton CAR raglan

byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).
 
byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).
 
byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

tr(X, Y) :- byCar(X, Y).
tr(X, Y) :- byTrain(X, Y).
tr(X, Y) :- byPlane(X, Y).

trx(X, Y, byCar) :- byCar(X, Y).
trx(X, Y, byTrain) :- byTrain(X, Y).
trx(X, Y, byPlane) :- byPlane(X, Y).

travel(X, Y) :- tr(X, Y).
travel(X, Y) :- travel(X, Z), tr(Z, Y).

% B
travel(X, Y, go(X, Y)) :- tr(X, Y).
travel(X, Y, go(X, Z, T)):- tr(X, Z), travel(Z, Y, T).

% C
travelx(X, Y, go(X, Y, N)) :- trx(X, Y, N).
travelx(X, Y, go(X, Z, N, T)):- trx(X, Z, N), travelx(Z, Y, T).





%**************************************

% Crossword puzzle

word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crosswd(A, B, C, D, E, F) :- word(A, _, A2, _, A4, _, A6, _), 
    						 word(B, _, B2, _, B4, _, B6, _),
                           	 word(C, _, C2, _, C4, _, C6, _),
                           	 word(D, _, D2, _, D4, _, D6, _),
                           	 word(E, _, E2, _, E4, _, E6, _),
                             word(F, _, F2, _, F4, _, F6, _),
    						 A2 = D2, B2 = D4, C2 = D6,
    						 A4 = E2, B4 = E4, C4 = E6,
    						 A6 = F2, B6 = F4, C6 = F6.

