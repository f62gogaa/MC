function [m,M,n,F,E_v,v0,r_0]=parametrosfijos(r0,P,T,E,E_max0,part,kb)
    %masa electron en kg
    m=9.1*10^-31;
    %masa particula neutra en kg
    M=10000*m;
    %Densidad particula neutras
    n=P/(kb*T);
    %CALCULO DE LA ACELERACIÓN:
    %Carga del electrón, en eV.
    q=1.6e-19;
    %Fuerza que se aplica al sistema.
    F=(q*n).*E;
    %Vector de energia para calcular t en eV.
    E_v=(0.01:0.01:E_max0);
    %Velocidad inicial m/s.
    v0=zeros(3,part);
        for w=1:1:part
            v0(:,w)=[rand rand 0.06].*1E6;
        end
    %Matriz r para iniciar todos desde el mismo punto en m.
    r_0=zeros(3,part);
        for k=1:1:part
            r_0(:,k)=r0;
        end
end



