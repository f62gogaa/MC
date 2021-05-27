%Comienzo limpiando el Workspace
clear
%Empiezo a definir las variables necesarias a lo largo del programa.
[P,T,E,r0,t0,E_max0,part,R,inter_max,n_save]=parametrosexternos();
[m,M,n,F,E_v,v0,r_0]=parametrosfijos(r0,P,T,E,E_max0,part,R);
%Calculo la maxima seccion:
[max_seccion]=t(E_v,n,v0);
%Calculo la energía media de todas las particulas inicialmente:
E_0=energia(v0,m,part);
%Inicia un bucle que calcula la posicion, velocidad, energia, colisiones
%para todas las particulas cada interacción:
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
        %Calculo tipo de colision por particula y su nueva velocidad.
        for p=1:1:part
            %Tipo colision
            [tp]=tipocolision(E_T(:,p),max_seccion);
            %Colision
            switch tp
                case 1
                    [v_n(:,p),E_T_n(:,p)]=elastica(v(:,p),m,M);
                case 2
                    [v_n(:,p),E_T_n(:,p)]=inelastica(v(:,p),m,E(:,p));
                case 3
                    v_n(:,p)=v(:,p);
                    E_T_n(:,p)=E_T(p);
            end
        end
        %Guardamos la primera interacción:
        R_T_I=[r];
        V_T_I=[v_n];
        %Guarda la energía media de todo el sistema
        E_T_m=[E_T_n'];     
    else
        %Calculamos el tiempo que avanza cada interacción, indices de los for
        %dentro j,l
        [t]=t(E_v,n,v);
        tT=[tT t];
        %Calculamos la posicion y la velocidad de las particulas.
        [r,v]=posicion(r,v_n,t,F,m,part);
        clear t
        %Calculamos la energía de las particulas:
        [E_T]=energia(v,m,part);
        %Calculo tipo de colision por particula y su nueva velocidad.
        for p=1:1:part
            %Tipo colision
            [tp]=tipocolision(E_T(:,p),max_seccion);
            %Colision
            switch tp
                case 1
                    [v_n(:,p),E_T_n(:,p)]=elastica(v(:,p),m,M);
                case 2
                    [v_n(:,p),E_T_n(:,p)]=inelastica(v(:,p),m,E(:,p));
                case 3
                    v_n(:,p)=v(:,p);
                    E_T_n(:,p)=E_T;
            end
            clear tp
        end
        %Defino estructura de if para que guarde datos cada x interacciones
        contador2=1;
        if contador2==n_save
            R_T_I=[R_T_I r];
            V_T_I=[V_T_I v_n];
            E_T_m=[E_T_m E_T_n'];
            clear contador2
        else
            E_T_m=[E_T_m E_T_n'];
            contador2=contador2+1;
        end
    end
end
E_plot=mean(E_T_m);