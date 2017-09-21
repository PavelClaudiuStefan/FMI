function [ m_arit, m_geom, m_armon ] = medie( a, b )
% Calculeaza media aritmetica, geometrica si armonica a numerelor a si b.

m_arit = (a + b) / 2;
m_geom = sqrt(a * b);
m_armon = 2 / (1 / a + 1 / b);

end

