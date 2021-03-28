function [m,M,n,F,E_v,v,r]=parametrosfijos(r0,P,T,E,E_max0,part,R)
    %masa electron
    m=9.1*10^-31;
    %masa particula neutra
    M=10000*m;
    %Densidad particula neutras
    n=P/(R*T);
    %Carga del electrón, en eV.
    q=1.6*10^-19;
    %Fuerza que se aplica al sistema.
    F=q.*E;
    %Vector de energia para calcular t.
    E_v=(0.01:0.01:E_max0);
    %Velocidad inicial.
        for w=1:1:part
            v(:,w)=[1 1 1];
        end
    %Matriz r para iniciar todos desde el mismo punto.
        for k=1:1:part
            r(:,k)=r0;
        end
            
end



