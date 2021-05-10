%CODIGO PRINCIPAL DE LA SIMULACION DE MONTECARLO.
%Comienzo el codigo limpiando el Workspace:
clear variables
%DEFINICIÓN DE PARÁMETROS DE ENTRADA Y CONSTANTES DEL PROGRAMA:
%Pide parámetros manejables por el usuario:
[P,T,E,r0,t0,E_max0,part,kb,inter_max,n_save]=parametrosexternos();
%Calcula parámetros fijos en el programa dependientes de los parámetros
%anteriores:
[m,M,n,F,E_v,v0,r_0]=parametrosfijos(r0,P,T,E,E_max0,part,kb);
%Calculo la seccion máxima:
max_seccion=maxiseccion(E_v);
%Calculo la energía inicial:
E_0=energia(v0,m,part);
%Predefino los vectores y matrices que voy a usar:
tT=[t0 zeros(1,inter_max)];
E_plot=[mean(E_0) zeros(1,inter_max)];
E_allinteraciones=zeros(part,inter_max);
%INICIO INTERACCIONES ENTRE PARTICULAS
for w=1:inter_max
    %Primera interaccion:
    if w==1
        %Calculo el primer salto de tiempo:
        dt=time(max_seccion,v,n,part);
        t=t0+dt;
        %Calculo la nueva posicion y velocidad:
        [r,v]=posicion(r_0,v0,t,F,m,part);
        %Calculo la energía de las particulas:
        E_allparticulas=energia(v,m,part);
        %COLISION:
        %Predefino vnueva Enueva:
        vnueva=zeros(3,part);
        Enueva=zeros(1,part);
        for g=1:part
            %Tipo de colision:
            tp=tipocolision(E_allparticulas(g),max_seccion);
            %Colision:
            switch tp
                %Colision Elastica:
                case 1
                    [vnueva(:,g),Enueva(g)]=elastica(v(:,g),m,M);
                %Colision Inelastica
                case 2
                    [vnueva(:,g),Enueva(g)]=ineslastica(v(:,g),m,E_allparticulas(g));
                %Colision Nula
                case 3
                    vnueva(:,g)=v(:,g);
                    Enueva(g)=E_allparticulas(g);
            end %Fin SWITCH COLISION
            %GUARDAR ENERGIA:
            E_allinteraciones(g,w+1)=Enueva;
        end %Fin BUCLE PARTICULAS COLISION
        %GUARDAR ENERGIA MEDIA Y TIEMPO:
        tT(w+1)=tT(w)+dt;
        E_plot(w+1)=mean(E_allinteraciones(:,w+1));
        %Demás interaccion:
    else
        %Calculo el salto de tiempo:
        dt=time(max_seccion,v,n,part);
        %Calculo la nueva posicion y velocidad:
        [r,v]=posicion(r,vnueva,dt,F,m,part);
        %Calculo la energía de las particulas:
        E_allparticulas=energia(v,m,part);
        %COLISION:
        %Predefino vnueva Enueva:
           vnueva=zeros(3,part);
           Enueva=zeros(1,part);
        for g=1:part
            %Tipo de colision:
            tp=tipocolision(E_allparticulas(g),max_seccion);
            %Colision:
            switch tp
                %Colision Elastica:
                case 1
                    [vnueva(:,g),Enueva(g)]=elastica(v(:,g),m,M);
                %Colision Inelastica
                case 2
                    [vnueva(:,g),Enueva(g)]=ineslastica(v(:,g),m,E_allparticulas(g));
                %Colision Nula
                case 3
                    vnueva(:,g)=v(:,g);
                    Enueva(g)=E_allparticulas(g);
            end %Fin SWITCH PARTICULAS COLISION
        end %Fin BUCLE PARTICULAS COLISION
        %GUARDAR ENERGIA MEDIA Y TIEMPO:
        tT(w+1)=tT(w)+dt;
        E_plot(w+1)=mean(E_allinteraciones(:,w+1));
    end %Fin BUCLE DIFERENCIANDO PRIMERA DE LAS DEMAS INTERACIONES
end %Fin BUCLE INTERACCIONES
%REPRESENTO ENERGÍA FRENTE A TIEMPO:
plot(0:inter_max,E_plot);
%PAUSA
pause;
%GENERACION DE DATOS:
%Vuelo a pedir numero maximo de interacciones
clear inter_max
inter_max=input('Nuevo numero de interaciones maximas ');
%Pido cauntos datos quiero guardar datos:
nsave=input('Guardar _ datos de posicion, valocidad ');
%Predefino matrices que guardaran mis datos:
%numero de matrices a guardar:
z=inter_max/nsave;
Z=floor(z);
posiciones=zeros(3,part,Z);
velocidades=zeros(3,part,Z);
%Repito bucle anterior de interaciones pero con la opcion de guardar:
for w=1:inter_max
    %Primera interaccion:
    if w==1
        %Calculo el primer salto de tiempo:
        dt=time(max_seccion,v,n,part);
        t=t0+dt;
        %Calculo la nueva posicion y velocidad:
        [r,v]=posicion(r_0,v0,t,F,m,part);
        %Calculo la energía de las particulas:
        E_allparticulas=energia(v,m,part);
        %COLISION:
        %Predefino vnueva Enueva:
        vnueva=zeros(3,part);
        Enueva=zeros(1,part);
        for g=1:part
            %Tipo de colision:
            tp=tipocolision(E_allparticulas(g),max_seccion);
            %Colision:
            switch tp
                %Colision Elastica:
                case 1
                    [vnueva(:,g),Enueva(g)]=elastica(v(:,g),m,M);
                %Colision Inelastica
                case 2
                    [vnueva(:,g),Enueva(g)]=ineslastica(v(:,g),m,E_allparticulas(g));
                %Colision Nula
                case 3
                    vnueva(:,g)=v(:,g);
                    Enueva(g)=E_allparticulas(g);
            end %Fin SWITCH COLISION
            %GUARDAR ENERGIA:
            E_allinteraciones(g,w+1)=Enueva;
        end %Fin BUCLE PARTICULAS COLISION
        %GUARDAR ENERGIA MEDIA Y TIEMPO:
        tT(w+1)=tT(w)+dt;
        E_plot(w+1)=mean(E_allinteraciones(:,w+1));
        %Demás interaccion:
    else
        %Calculo el salto de tiempo:
        dt=time(max_seccion,v,n,part);
        %Calculo la nueva posicion y velocidad:
        [r,v]=posicion(r,vnueva,dt,F,m,part);
        %Calculo la energía de las particulas:
        E_allparticulas=energia(v,m,part);
        %COLISION:
        %Predefino vnueva Enueva:
           vnueva=zeros(3,part);
           Enueva=zeros(1,part);
        for g=1:part
            %Tipo de colision:
            tp=tipocolision(E_allparticulas(g),max_seccion);
            %Colision:
            switch tp
                %Colision Elastica:
                case 1
                    [vnueva(:,g),Enueva(g)]=elastica(v(:,g),m,M);
                %Colision Inelastica
                case 2
                    [vnueva(:,g),Enueva(g)]=ineslastica(v(:,g),m,E_allparticulas(g));
                %Colision Nula
                case 3
                    vnueva(:,g)=v(:,g);
                    Enueva(g)=E_allparticulas(g);
            end %Fin SWITCH PARTICULAS COLISION
        end %Fin BUCLE PARTICULAS COLISION
        %GUARDAR ENERGIA MEDIA Y TIEMPO:
        tT(w+1)=tT(w)+dt;
        E_plot(w+1)=mean(E_allinteraciones(:,w+1));
    end %Fin BUCLE DIFERENCIANDO PRIMERA DE LAS DEMAS INTERACIONES
    %GUARDAR DATOS:
    for c=1:nsave:w
        posiciones(:,:,c)=r;
        velocidades(:,:,c)=vnueva;
    end %Fin BUCLE GUARDAR CADA X INTERACIONES
end %Fin BUCLE INTERACCIONES
%GENERACION DE ARCHIVOS:

%HISTORIGRAMA:

        
    