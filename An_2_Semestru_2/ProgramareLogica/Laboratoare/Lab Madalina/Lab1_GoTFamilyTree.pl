male(rickard_stark).
male(eddard_stark).
male(brandon_stark).
male(benjen_stark).
male(robb_stark).
male(bran_stark).
male(rickon_stark).
male(jon_snow).
male(aerys_targaryen).
male(viserys_targaryen).
male(rhaegar_targaryen).
male(aegon_targaryen).

female(lyarra_stark).
female(catelyn_stark).
female(lyanna_stark).
female(sansa_stark).
female(arya_stark).
female(rhaella_targaryen).
female(elia_targaryen).
female(daenerys_targaryen).
female(rhaenys_targaryen).

%Stark
parent_of(rickard_stark, eddard_stark).
parent_of(rickard_stark, brandon_stark).
parent_of(rickard_stark, benjen_stark).
parent_of(rickard_stark, lyanna_stark).
parent_of(lyarra_stark, eddard_stark).
parent_of(lyarra_stark, brandon_stark).
parent_of(lyarra_stark, benjen_stark).
parent_of(lyarra_stark, lyanna_stark).
parent_of(eddard_stark, robb_stark).
parent_of(eddard_stark, sansa_stark).
parent_of(eddard_stark, arya_stark).
parent_of(eddard_stark, bran_stark).
parent_of(eddard_stark, rickon_stark).
parent_of(catelyn_stark, robb_stark).
parent_of(catelyn_stark, sansa_stark).
parent_of(catelyn_stark, arya_stark).
parent_of(catelyn_stark, bran_stark).
parent_of(catelyn_stark, rickon_stark).

%Targaryen
parent_of(aerys_targaryen, rhaegar_targaryen).
parent_of(aerys_targaryen, viserys_targaryen).
parent_of(aerys_targaryen, daenerys_targaryen).
parent_of(rhaella_targaryen, rhaegar_targaryen).
parent_of(rhaella_targaryen, viserys_targaryen).
parent_of(rhaella_targaryen, daenerys_targaryen).
parent_of(rhaegar_targaryen, aegon_targaryen).
parent_of(rhaegar_targaryen, rhaenys_targaryen).
parent_of(elia_targaryen, aegon_targaryen).
parent_of(elia_targaryen, rhaenys_targaryen).

%Snow
parent_of(lyanna_stark, jon_snow).
parent_of(rhaegar_targaryen, jon_snow).

father_of(Father, Child) :- male(Father), parent_of(Father, Child).
mother_of(Mother, Child) :- female(Mother), parent_of(Mother, Child).
grandfather_of(Grandfather, Grandchild) :- father_of(Grandfather, Parent), parent_of(Parent, Grandchild).
grandmother_of(Grandmother, Grandchild) :- mother_of(Grandmother, Parent), parent_of(Parent, Grandchild).
sister_of(Sister, Person) :- female(Sister), parent_of(Father, Sister), parent_of(Father, Person), Sister \= Person.
brother_of(Brother, Person) :- male(Brother), parent_of(Father, Brother), parent_of(Father, Person), Brother \= Person.
aunt_of(Aunt, Person) :- sister_of(Aunt, Parent), parent_of(Parent, Person).
uncle_of(Uncle, Person) :- brother_of(Uncle, Parent), parent_of(Parent, Person).
