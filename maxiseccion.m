function [max_seccion]=maxiseccion(E)
    %Esta función define el valor maximo de las secciones eficaces para
    %calcular el tiempo que permanece constante durante todo el codigo.
    %Primero predefino las dimensiones de los vectores que van a contener
    %los datos de seccion eficaz de cada colision.
    s1=zeros(1,length(E));
    s2=zeros(1,length(E));
    %Ahora calculo los valores de secciones eficaces.
    for j=1:1:length(E)
        s1(j)=seccion1(E(j));
        s2(j)=seccion2(E(j));
    end
    %Ahora calculo la suma de las dos secciones dato por dato:
    sT=s1+s2;
    %Calculo el valor maximo de dicha seccion.
    max_seccion=max(sT);
end