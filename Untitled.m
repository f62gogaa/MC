%Comienzo limpiando el Workspace
clear
%Defino variables:
P=101324720;
E_max0=1000;
R=1.380649000000000e-23;
n_save=500;
part=150;
inter_max=5000;
r0=[0 0 0];
E=[0 0 10.0000e-21];
t0=0;
T=300;
[m,M,n,F,E_v,v0,r_0]=parametrosfijos(r0,P,T,E,E_max0,part,R);
%Defino vector tT:
tT=zeros(1,part);
tT=[t0 tT];
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
        %Calculo la energía de cada particula:
        [E_T]=energia(v,m,part);
        %Paso la energía a eV que es la unidad de las secciones eficaces.
        E_TeV=6.2415e18.*E_T;
        %Calculo tipo de colision por particula y su nueva velocidad.
        for p=1:1:part
            %Tipo colision
            [tp]=tipocolision(E_TeV(p),max_seccion);
            %Colision
            switch tp
                case 1
                    [v_n(:,p),E_T_n(p)]=elastica(v(:,p),m,M);
                case 2
                    [E_T_n(:,p),v_n(p)]=inelastica(v(:,p),m,E_T(p));
                case 3
                    v_n(:,p)=v(:,p);
                    E_T_n(p)=E_T(p);
            end
            %Prueba a guardar el tipo de colision para ver si cambia
            TP=[tp];
            %Limpio tipo de colision para esta particula
            clear tp
        end
        %Borro la antigua velocidad y energía:
        clear v E_T
        %Guardamos la primera interacción:
        R_T_I=(r);
        V_T_I=(v_n);
        %Guarda la energía de cada particula en una columna
        E_T_m=[E_T_n'];     
    else
        %Calculamos el tiempo que avanza cada interacción, indices de los for
        %dentro j,l
        [t]=t(E_v,n,v_n);
        tT=[tT t];
        %Calculamos la posicion y la velocidad de las particulas.
        [r,v]=posicion(r,v_n,t,F,m,part);
        clear t
        %Calculamos la energía de cada particula:
        [E_T]=energia(v,m,part);
        %Paso la energía a eV que es la unidad de las secciones eficaces.
        E_TeV=6.2415e18.*E_T;
        %Calculo tipo de colision por particula y su nueva velocidad.
        for p=1:1:part
            %Tipo colision
            [tp]=tipocolision(E_TeV(p),max_seccion);
            %Colision
            switch tp
                case 1
                    [v_n(:,p),E_T_n(p)]=elastica(v(:,p),m,M);
                case 2
                    [E_T_n(p),v_n(:,p)]=inelastica(v(:,p),m,E_T(p));
                case 3
                    v_n(:,p)=v(:,p);
                    E_T_n(p)=E_T(p);
            end
            %Guardo tipo de colision para comprobar que cambia.
            TP=[TP tp];
            %Limpio el tipo de colision de esta particula
            clear tp
        end
        %Borro la antigua velocidad y energía:
        clear v E_T
        %Defino estructura de if para que guarde datos cada x interacciones
        contador2=1;
        if contador2==n_save
            %Guardo las cosas en un array multidimensional, cada "pagina
            %nueva" sera una interaccion:
            R_T_I(:,:,w)=[r];
            V_T_I(:,:,w)=[v_n];
            E_T_m=[E_T_m E_T_n'];
            %Limpio el contador para que comience de nuevo:
            clear contador2
            %Limpio la energía que ya esta guardad:
            clear E_T_n
        else
            %Siempre guado la energía en cada interacion
            E_T_m=[E_T_m E_T_n'];
            %Limpio la energía que ya esta guardada:
            clear E_T_n
            %Añado un 1 al contador:
            contador2=contador2+1;
        end
    end
end
E_plot=mean(E_T_m);
E_plot=[mean(E_0') E_plot];
    