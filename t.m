function [t,max_seccion]=t(E_v,n,v)
%Calculo el valor de la seccion eficaz de cada colision para los valores
%del vector de E
%Defino un vector que tenga las dimensiones que le corresponden a s1 y s2.
s1=zeros(1,length(E_v));
s2=zeros(1,length(E_v));
    for j=1:1:length(E_v)
        s1(:,j)=seccion1(E_v(:,j));
        s2(:,j)=seccion2(E_v(:,j));
    end
%Calculo la suma de las secciones que hemos obtenido
sT=s1+s2;
%Calculo el máximo de esa seccion total.
max_seccion=max(sT);
%Normalizo las secciones una vez conozco la maxima.
s1_n=zeros(1,length(s1));
s2_n=zeros(1,length(s2));
for l=1:1:length(E_v)
    s1_n(:,l)=s1(:,l)/max_seccion;
    s2_n(:,l)=s2(:,l)/max_seccion;
end
%Vuelvo a sumar la dos secciones
sT_n=s1_n+s2_n;
%Calculo la velocidad media.
v_media=mean(mean(v));
%Calculo de la frecuencia de colision para el valor mas alto de sT_n
max_seccion_n=max(sT_n);
frec_max=n*abs(v_media)*max_seccion_n;
%Ahora calculo el salto de tiempo como
t=-(log(rand)/frec_max);
end



    
    
    