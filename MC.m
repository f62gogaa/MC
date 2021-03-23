%Comienzo llamando la función BLOQUE1(), esta función me va a permitir
%meter los parametros que yo voy a controlar de la simulacion y va a
%definir algunas variables internas (como constantes o valores fijos que yo
%necesite). En esta funcion, necesito una funcion que me calcule las
%velocidades iniciales siguiendo una función de distribuición Maxwelliana.
BLOQUE1()
%Calculo el salto de tiempo.
t=t(E_v,T,m,R);
for w=1:1:part
    %Cacula la posicion donde esta mi particula cuando llega el momento de
    %la colision.
    [r,v]=posicion(r0,v0,t,F,m);
    %Ahora calculo la energía que tiene mi particula para calcula el tipo
    %de colision.
    E=energia(v,m);
    %Ahora calculo el tipo de colision que se da.
    tipocolision=tipocolision(E);
    switch tipocolision
        case 1
            [v_n,E_n]=elastica(v,E);
        case 2
            [v_n,E_n]=inelastica(v,E);
        case 3
            v_n=v;
            E_n=E;
    end
    %Guardo en cada columna los datos de cada particula, y en cada fila una
    %coordenada de mi sistema de 3D.
    R_T(:,w)=r';
    V_T(:,w)=v_n';
    E_T(:,w)=E_v;
end
%Redifinir las condiciones iniciales de las particulas para cada una de
%ella.


