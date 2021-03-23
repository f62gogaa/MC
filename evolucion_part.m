for w=1:1:part
    %Calculo velocidad inicial segun Distribución de Maxwell.
    %Cacula la posicion donde esta mi particula cuando llega el momento de
    %la colision.
    [r,v]=posicion(r0,v0,t,t0,F,m);
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
    %Redefino las condiciones iniciales (esto lo debo definir fuera).
    r0=r;
    v0=v_n;
    t0=t;
    E=E_n;
    %Guardo en cada columna los datos de cada particula, y en cada fila una
    %coordenada de mi sistema de 3D.
    R_T(:,w)=r0';
    V_T(:,w)=v0';
    E_T(:,w)=E;
end
%Cambiar a funcion.
    