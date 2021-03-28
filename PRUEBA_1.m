%Comienza el programa pidiendo los datos necesarios para que pueda actuar,
%a la vez define las constantes necesarias que no son elegibles por el
%sujeto.
%Este programa comienza con la operacion de borrar todas las variables que
%han sido guardadas anteriormente.
[P,T,E,r0,t0,E_max0,part,R,inter_max]=parametrosexternos();
[m,M,n,F,E_v,v,r]=parametrosfijos(r0,P,T,E,E_max0,part,R);
%Incia un bucle para que se repita todo el proceso para un numero finito de
%interacciones.
for w=1:1:inter_max
    %Calculamos el tiempo que avanza cada interacción
    [t]=t(E_v,n,v);
    %Iniciamos bucle en el que movemos cada particula de forma individual
    for k=1:1:part
        %Si es la primera interacción, debemos sumarle a t, el tiempo de
        %incial.
        if k==1
            t=t+t0;
        end
        %Con una función calculamos su posición y velocidad en el tiempo t
        posicion(r,v,t,F,m,k);
        %Guardamos los datos obtenidos para cada particula.
        R_T(:,k)=r;
        V_T(:,k)=v;
        %Calculamos la energía de cada particula y la guardamos
        energia();
        E_T(:,k);
    end
    %Guardamos todos los datos de una interacción
    R_T_I(:,w)=R_T;
    V_T_I(:,w)=V_T;
    %La energía vamos a guardar cada interaccion la energia media de todas
    %las particulas.
    E_T_m(:,w)=mean(E_T);
end
%Representamos los datos en dos gráficas, una gráfica de posición y otras
%gráfica de energía.
%REPRESENTACIÓN DE POSCIONES.

%REPRESENTACION DE ENERGÍA.