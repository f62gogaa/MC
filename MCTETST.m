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
TESTPOSICIONES=zeros(3,part,inter_max/1000);
TESTVELOCIDADES=zeros(3,part,inter_max/1000);
contador=0;
d=0;
%INICIO INTERACCIONES ENTRE PARTICULAS
for w=1:inter_max
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
                    [vnueva(:,g),Enueva(g)]=inelastica(v(:,g),m,E_allparticulas(g));
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
        dt=time(max_seccion,vnueva,n,part);
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
                    [vnueva(:,g),Enueva(g)]=inelastica(v(:,g),m,E_allparticulas(g));
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
    %GUARDO DATOS CADA 1000 INTERACCIONES:
    if contador==1000
        d=d+1;
        TESTPOSICIONES(:,:,d)=r;
        TESTVELOCIDADES(:,:,d)=vnueva;
        contador=0;
    else
    contador=contador+1;
    end %Fin BUCLE GUARDAR
end %Fin BUCLE INTERACCIONES
%REPRESENTACIÓN ENERGÍA VS INTERACCIONES:
FUNCIONENERGIA=plot(0:inter_max,E_plot);
%PAUSAR:
pause;
%GENERACIÓN DE DATOS:
empezar=input('Interaccion (multiplo de 1000) desde la que quiero empezar a guardar datos ');
final=input('Número de pruebas que quiero realizar ');
%Definir variables de inicio:
r=TESTPOSICIONES(:,:,empezar);
vnueva=TESTVELOCIDADES(:,:,empezar);
%Predefinir matriz y vectores necesarios:
KEPTENERGY=zeros(1,final);
%BUCLE generar datos:
clear w
for w=1:final
    %Calculo el salto de tiempo:
        dt=time(max_seccion,vnueva,n,part);
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
                    [vnueva(:,g),Enueva(g)]=inelastica(v(:,g),m,E_allparticulas(g));
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
end %Fin BUCLE GUARDAR DATOS
    
%GENERACION DE ARCHIVOS:

%HISTORIGRAMA:

        