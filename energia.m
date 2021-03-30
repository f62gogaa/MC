function [E]=energia(v,m,part)
%Esta funcion calculo el modulo de la velocidad y su energia cinetica.
%Comenzamos calculando el modulo de la velocidad de cada particula.
%Predefinimos las dimensiones de los vectores vmodulo, E.
E=zeros(1,part);
    for k=1:1:part
        vmodulo=norm(v(:,k));
        E(:,k)=0.5*m*vmodulo^2;
    end
end