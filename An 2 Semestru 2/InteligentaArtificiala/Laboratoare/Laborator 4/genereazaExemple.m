function [X, U] = genereazaExemple(n)

X = rand(n, 1)
U = sin(2 * pi * X) + rand(n, 1)

end