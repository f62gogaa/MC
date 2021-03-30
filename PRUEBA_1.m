%Comienza el programa pidiendo los datos necesarios para que pueda actuar,
%a la vez define las constantes necesarias que no son elegibles por el
%sujeto.
%Este programa comienza con la operacion de borrar todas las variables que
%han sido guardadas anteriormente.
[P,T,E,r0,t0,E_max0,part,R,inter_max]=parametrosexternos();
[m,M,n,F,E_v,v0,r_0]=parametrosfijos(r0,P,T,E,E_max0,part,R);
%Incia un bucle para que se repita todo el proceso para un numero finito de
%interacciones.
%Predefinimos las dimensiones de las matrices que van a guardar todos los
%datos de las interacciones.

for w=1:1:inter_max
    %Primero elimino el valor de la variable t
    clear t tI
    %Calculo el tiempo para la primera interaccion
    if w==1
        [t]=t(E_v,v0);
    end
    %Calculamos el tiempo que avanza cada interacción, indices de los for
    %dentro j,l
    [t]=t(E_v,n,v);
    %Calculamos el tiempo total con el tiempo anterior.
    tI=t0+t;
    %Calculamos la posicion y velocidad de las particulas
    [r,v]=posicion(r_0,v0,tI,F,m,part);
    %Nuevo valor de t0
    clear t0
    t0=tI;
    clear tI
    %Calculamos la energía de cada particula.
    [E_T]=energia(v,m,part);
end
%Representamos los datos en dos gráficas, una gráfica de posición y otras
%gráfica de energía.
%REPRESENTACIÓN DE POSCIONES.

%REPRESENTACION DE ENERGÍA.