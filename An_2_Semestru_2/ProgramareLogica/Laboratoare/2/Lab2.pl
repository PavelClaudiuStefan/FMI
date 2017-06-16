sits_right_of(cersei_baratheon, tywin_lannister).
sits_right_of(tywin_lannister, petyr_baelish).
sits_right_of(petyr_baelish, varys).
sits_right_of(varys, grand_maester_pycelle).
sits_right_of(grand_maester_pycelle, tyrion_lannister).
sits_right_of(tyrion_lannister, janos_slynt).
sits_right_of(janos_slynt, cersei_baratheon).

sits_left_of(X, Y) :- sits_right_of(Y, X).

are_neighbors_of(X, Y, Z) :- sits_left_of(X, Z), sits_right_of(Y, Z).

next_to_each_other(X, Y) :- sits_left_of(X, Y).
next_to_each_other(X, Y)  :- sits_right_of(X, Y).

doua_scaune_dist(X, Z) :- sits_right_of(X, Y), sits_right_of(Y, Z).

n_scaune_dist(X, Y, 1) :- sits_right_of(X, Y).
n_scaune_dist(X, Y, N) :- n_scaune_dist(Z, Y, M), N is M + 1, sits_right_of(X, Z). 
%n_scaune_dist(X, Y, 3).
