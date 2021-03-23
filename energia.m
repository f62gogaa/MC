function [E]=energia(v,m)
%Esta funcion calculo el modulo de la velocidad y su energia cinetica.
    vmodulo=norm(v);
    E=0.5*m*vmodulo^2;
end