function [tipocolision]=tipocolision(E)
%Esta función calcula la probabilidad que hay de que haya una colision u
%otra y dictamina de forma aleatoria la colision que se da.
%Primero calculo la suma de todas las secciones para normalizarla
    secciontotal=seccion1(E)+seccion2(E)+seccion3(E);
%Calculo vector para estructura y si
    seccion_cond=[seccion1(E)/secciontotal (seccion1(E)+seccion2(E))/secciontotal 1];
%Genero numero aleatorio entre 0 y 1
    random=rand;
%Estructura y si para seleccionar tipo de colision
    if (random>=0)&&(random<=seccion_cond(:,1))
        tipocolision=1;
    elseif (random>seccion_cond(:,1))&&(random<=seccion_cond(:,2))
        tipocolision=2;
    else
        tipocolision=3;
    end
end

    