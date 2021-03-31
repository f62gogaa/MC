%Comienza el programa pidiendo los datos necesarios para que pueda actuar,
%a la vez define las constantes necesarias que no son elegibles por el
%sujeto.
%Este programa comienza con la operacion de borrar todas las variables que
%han sido guardadas anteriormente.
[P,T,E,r0,t0,E_max0,part,R,inter_max]=parametrosexternos();
[m,M,n,F,E_v,v0,r_0]=parametrosfijos(r0,P,T,E,E_max0,part,R);
%Inicio un bucle que vaya calculando las posiciones y velocidades de las
%particulas en cada interacción.
for w=1:1:inter_max
    %Primero elimino el valor de la variable t
    clear t
    if w==1
        %Calculo el tiempo para la primera interaccion
        [t]=t(E_v,n,v0);
        tT=[t0 t];
        tI=sum(tT);
        %Calculo la posicion y velocidad para la primera interacción.
        [r,v]=posicion(r_0,v0,tI,F,m,part);
        clear tI
        %Calculo la energía de las paticulas:
        [E_T]=energia(v,m,part);
        %Guardamos la primera interacción:
        R_T_I=[r];
        V_T_I=[v];
        %Guarda la energía media de todo el sistema
        E_T_m=[mean(E_T)];
        
    else
        %Calculamos el tiempo que avanza cada interacción, indices de los for
        %dentro j,l
        [t]=t(E_v,n,v);
        tT=[tT t];
        tI=sum(tT);
        %Calculamos la posicion y la velocidad de las particulas.
        [r,v]=posicion(r,v,tI,F,m,part);
        clear tI
        %Calculamos la energía de las particulas:
        [E_T]=energia(v,m,part);
        %Guarda los datos de cada interacción:
        R_T_I=[R_T_I r];
        V_T_I=[V_T_I v];
        %Guarda la energia media de todo el sistema
        E_T_m=[E_T_m mean(E_T)];  
    end
end
%Representamos los datos en dos gráficas, una gráfica de posición y otras
%gráfica de energía.
%REPRESENTACIÓN DE POSCIONES.

%REPRESENTACION DE ENERGÍA.