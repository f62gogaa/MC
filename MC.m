%CODIGO PRINCIPAL DE LA SIMULACION DE MONTECARLO.
%Comienzo el codigo limpiando el Workspace:
clear variables
%DEFINICIÓN DE PARÁMETROS DE ENTRADA Y CONSTANTES DEL PROGRAMA:
%Pide parámetros manejables por el usuario:
[P,T,E,r0,t0,E_max0,part,kb,inter_max]=parametrosexternos();
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
    %REPRESENTACIÓN ENERGÍA FRENTE A INTERACCIONES CADA 100 INTERACCIONES:
    for y=1:100:inter_max
    %Primera interaccion:
    if w==1
        %Calculo el primer salto de tiempo:
        dt=time(max_seccion,v0,n,part);
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
            E_allinteraciones(g,1)=Enueva(g);
        end %Fin BUCLE PARTICULAS COLISION
        %GUARDAR ENERGIA MEDIA Y TIEMPO:
        tT(2)=tT(1)+dt;
        E_plot(2)=mean(E_allinteraciones(:,1));
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
            %GUARDAR ENERGIA:
            E_allinteraciones(g,w)=Enueva(g);
        end %Fin BUCLE PARTICULAS COLISION
        %GUARDAR ENERGIA MEDIA Y TIEMPO:
        tT(w+1)=tT(w)+dt;
        E_plot(w+1)=mean(E_allinteraciones(:,w));
    end %Fin BUCLE DIFERENCIANDO PRIMERA DE LAS DEMAS INTERACIONES
    %REPRESENTACIÓN ENERGÍA VS INTERACCIÓN:
    FUNCIONENERGIA=plot(0:y,E_plot);
    %PAUSE
    pause;
    %ESTABILIDAD ENERGÍA:
    %Guardo ultima interacción:
    yfinal=y;
    %Pregunto si la energía la considero estable o no
    avan=input('Energía estable: YES=1 OR NO=0 ');
    switch avan
        case 1 %ENERGIA ESTABLE
            %Pido nuevo número máximo de interacciones:
            clear inter_max
            inter_max=input('Numero de interacciones para recolectar datos ');
            %Predefino vectores y matrices que van a ser necesarios:
            POSICIONES=zeros(3,part,inter_max);
            VELOCIDADES=zeros(3,part,inter_max);
            %Diferencia entre número de interacciones máximas:
            anadir=yfinal+inter_max-length(E_allinteraciones);
            if anadir>0
                TIEMPO=[tT zeros(1,anadir)];
                ENERGIA_ALLINTER=[E_allinteraciones zeros(1,anadir)];
            else
                TIEMPO=tT;
                ENERGIA_ALLINTER=E_allinteraciones;
            end
            %GENERACION DE DATOS:
            for b=yfinal:inter_max
                %Calculo el salto de tiempo:
                dt=time(max_seccion,vnueva,n,part);
                %Calculo la nueva posicion y velocidad:
                [r,v]=posicion(r,vnueva,dt,F,m,part);
                %Calculo la energia de las particulas:
                E_allparticulas=energia(v,m,part);
                %COLISION:
                %Predefino vnueva Enueva:
                d=0;
                vnueva=zeros(3,part);
                Enueva=zeros(1,part);
                for g=1:part
                    %Tipo de colision:
                    tp=tipocolision(E_allparticulas(g),max_seccion);
                        %Colision:
                        switch tp
                            %Colision elastica:
                            case 1
                                [vnueva(:,g),Enueva(g)]=elastica(v(:,g),m,M);
                            %Colision inelastica:
                            case 2
                                [vnueva(:,g),Enueva(g)]=inelastica(v(:,g),m,E_allparticulas(g));
                            %Colsion nula:
                            case 3
                                vnueva(:,g)=v(:,g);
                                Enueva(g)=E_allparticulas(g);
                        end %Fin SWITCH PARTICULAS COLISION
                        %GUARDAR ENERGIA:
                        ENERGIA_ALLINTER(g,b)=Enueva(g);
                end %Fin BUCLE PARTICULAS COLISION
            %GUARDAR ENERGIA MEDIA,TIEMPO,POSICION,VELOCIDAD:
            TIEMPO(b+1)=TIEMPO(b)+dt;
            d=d+1;
            POSICIONES(:,:,d)=r;
            VELOCIDADES(:,:,d)=vnueva;
            end %Fin BUCLE GENERACIÓN DE DATOS
        case 2 %ENERGÍA INESTABLE
            clear avan rfinal vfinal yfinal
    end %Fin SWITCH AVAN
    %Fin ESTABILIDAD ENERGÍA
    %SALIDA BUCLE REPRESENTACION ENERGIA VS INTERACCION CASO ESTABILIDAD:
    if avan==1
        break
    end %Fin SALIDA BUCLE
    end %Fin BUCLE REPRESENTACIÓN ENERGIA VS INTERACCION.
    %SALIDA EN CASO DE ESTABILIDAD:
    if avan==1
        break
    end %Fin SALIDA
end %Fin BUCLE INTERACCIONES
%GENERACION DE ARCHIVOS:

%HISTORIGRAMA:
figure
HISTORGRAMA=histogram(E_allinteraciones(:,inter_max),30);
        
    