function [r,v]=posicion(r,v,t,F,m,part)
%Esta funcion calcula la posicion y la velocida en el instante t
%v,r contiene la información de todas las particulas de la simulación
%BUCLE PARTICULA
    for k=1:1:part
%BUCLE COMPONENTE
        for i=1:1:3
        r(i,k)=r(i,k)+v(i,k)*t+0.5*(F(:,i)/m)*t^2;
        v(i,k)=v(i,k)+(F(:,i)/m)*t;
        end
    end
end
