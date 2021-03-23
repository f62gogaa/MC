function [t,max_seccion]=t(E_v,T,m,R)
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
for l=1:1:length(E)
    s1_n=s1(:,l)/max_seccion;
    s2_n=s2(:,l)/max_seccion;
end
%Vuelvo a sumar la dos secciones y saco el maximo valor.
sT_n=s1_n+s2_n;
max_seccion_n=max(sT_n);
%Defino valor de la constante de Boltzmann en eV/K.
k_B=8.6180e-05;
%Calculo la frecuencia de colision con la distribucion de Maxwell, la
%formula sale de los apuntes de Plasma (Esto no estoy segura).
frec_max=n*max_seccion_n*((8*k_B*T)/(pi*m))^(1/2);
%Genero un numero aleatorio.
A=rand;
%Calculo el tiempo entre colisiones, este es fijo durante toda la
%simulacion.
t=-(log(A)/frec_max);
%Alternativa:
%Calculo velocidad media de la distribucion de velocidades de maxwell.
NA=6.022140857*10^23;
vm_M=((8*R*T)/(pi*m*NA))^(1/2);
%Calculo de la frecuencia de colision por dato:
    for d=1:1:length(E)
        frec(:,d)=n*vm_M*sT_n(:,d);
    end
    %Calculo la frecuencia maxima de ese vector.
    frec_max_A=max(frec);
end



    
    
    