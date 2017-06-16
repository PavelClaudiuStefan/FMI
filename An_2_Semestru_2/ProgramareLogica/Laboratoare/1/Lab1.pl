% Ancestors: Stark & Targaryen

male(rickard_stark).
male(aerys_targaryen).
male(eddard_stark).
male(brandon_stark).
male(benjen_stark).
male(rhaegar_targaryen).
male(viserys_targaryen).
male(robb_stark).
male(bran_stark).
male(rickon_stark).
male(jon_snow).
male(aegon_targaryen).

female(lyarra_stark).
female(rhaella_targaryen).
female(catelyn_stark).
female(lyanna_stark).
female(elia_targaryen).
female(daenerys_targaryen).
female(sansa_stark).
female(arya_stark).
female(rhaenys_targaryen).

parent_of(rickard_stark, eddard_stark).
parent_of(rickard_stark, brandon_stark).
parent_of(rickard_stark, benjen_stark).
parent_of(rickard_stark, lyanna_stark).

parent_of(lyarra_stark, eddard_stark).
parent_of(lyarra_stark, brandon_stark).
parent_of(lyarra_stark, benjen_stark).
parent_of(lyarra_stark, lyanna_stark).

parent_of(catelyn_stark, robb_stark).
parent_of(catelyn_stark, sansa_stark).
parent_of(catelyn_stark, arya_stark).
parent_of(catelyn_stark, bran_stark).
parent_of(catelyn_stark, rickon_stark).

parent_of(eddard_stark, robb_stark).
parent_of(eddard_stark, sansa_stark).
parent_of(eddard_stark, arya_stark).
parent_of(eddard_stark, bran_stark).
parent_of(eddard_stark, rickon_stark).

parent_of(lyanna_stark, jon_snow).
parent_of(rhaegar_targaryen, jon_snow).

parent_of(aerys_targaryen, rhaegar_targaryen).
parent_of(aerys_targaryen, elia_targaryen).
parent_of(aerys_targaryen, viserys_targaryen).
parent_of(aerys_targaryen, daenerys_targaryen).

parent_of(rhaella_targaryen, rhaegar_targaryen).
parent_of(rhaella_targaryen, elia_targaryen).
parent_of(rhaella_targaryen, viserys_targaryen).
parent_of(rhaella_targaryen, daenerys_targaryen).

parent_of(rhaegar_targaryen, rhaenys_targaryen).
parent_of(rhaegar_targaryen, aegon_targaryen).

parent_of(elia_targaryen, rhaenys_targaryen).
parent_of(elia_targaryen, aegon_targaryen).

rel(X, Y, father) :- parent_of(X, Y), male(X).

rel(X, Y, mother) :- parent_of(X, Y), female(X).

rel(X, Y, grandfather) :- rel(X, Z, father), parent_of(Z, Y).

rel(X, Y, grandmother) :- rel(X, Z, mother), parent_of(Z, Y).

rel(X, Y, sister) :- female(X), parent_of(Z, X), parent_of(Z, Y), not(X = Y).

rel(X, Y, brother) :- male(X), parent_of(Z, X), parent_of(Z, Y), not(X = Y).

rel(X, Y, aunt) :- rel(X, Z, sister), parent_of(Z, Y).

rel(X, Y, uncle) :- rel(X, Z, brother), parent_of(Z, Y).                           
