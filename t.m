function [t,max_seccion]=t(E_v,n,v)
%Calculo el valor de la seccion eficaz de cada colision para los valores
%del vector de E
    for j=1:1:length(E_v)
        s1(:,j)=seccion1(E_v(:,j));
        s2(:,j)=seccion2(E_v(:,j));
    end
%Calculo la suma de las secciones que hemos obtenido
sT=s1+s2;
%Calculo el máximo de esa seccion total.
max_seccion=max(sT);
%Normalizo las secciones una vez conozco la maxima.
for l=1:1:length(E_v)
    s1_n=s1(:,l)/max_seccion;
    s2_n=s2(:,l)/max_seccion;
end
%Vuelvo a sumar la dos secciones
sT_n=s1_n+s2_n;
%Calculo la velocidad media.
v_media=(calcular valor medio de v);
%Calculo de la frecuencia de colision por dato:
    for d=1:1:length(E)
        frec(:,d)=n*v_media*sT_n(:,d);
    end
    %Calculo la frecuencia maxima de ese vector.
    frec_max=max(frec);
    %Calculo el tiempo entre colisión y colisión.
    t=-(log(rand)/frec_max);
end



    
    
    