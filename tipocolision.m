function [tipocolision]=tipocolision(E,max_seccion)
    %Esta funcion calcula la probabilidad de que halla una colision u otra
    %y dictamina el tipo de colision que se da de forma aleatoria.
    %Paso la energía a eV:
    Es=E/1.60e-19;
    %Calculo las secciones para el valor de energia E.
    S1=seccion1(Es);
    S2=seccion2(Es);
    S3=max_seccion-S1-S2;
    %Creo un vector con todas las secciones.
    seccion_sin=[S1 S2 S3];
    %Calculo el valor maximo para normalizar
    SMAX=max(seccion_sin);
    %Calcula vector con las secciones normalizadas.
    seccion_cond=seccion_sin./SMAX;
    %Genero un numero aleatorio que me dictara el tipo de colision que
    %obtengo.
    random=rand;
    %Creo estructura de if que me selecciona el tipo de colision:
    if (random>=0)&&(random<seccion_cond(1))
        %Colision Elastica
        tipocolision=1;
    elseif (random>seccion_cond(1))&&(random<(seccion_cond(1)+seccion_cond(2)))
        %Colision Inelastica
        tipocolision=2;
    else
        %Colision Nula
        tipocolision=3;
    end
end

    