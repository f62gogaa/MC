function [t]=time(max_seccion,v,n,part)
    %Esta función calcula el tiempo entre colisiones que es aleatorio pero
    %que depende de la frecuncia de colision del sistema. 
    %CALCULO FRECUENCIA DE COLISION:
    %calculo de la media del modulo de la velocidad:
    %Predefino un vector donde guardo los datos del modulo de la velocidad
    vmodulo=zeros(1,part);
    %Lo relleno
    for y=1:part
        vmodulo(y)=norm(v(:,y));
    end
    %Calculo la velocidad media:
    vmedia=mean(vmodulo);
    %Calculo la frecuencia de colsion con vmedia,n,max_seccion:
    frec_colision=n*vmedia*max_seccion;
    %CALCULO EL SALTO DE TIEMPO:
    t=-(log(rand)/frec_colision);
end
    