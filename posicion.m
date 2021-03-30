function [r,v]=posicion(r_0,v0,tI,F,m,part)
%Esta función calcula la posicion de la particula en el instante t con un
%valor de posicion inicial fijo.
%Predefino las dimensiones de las matriz r
r=zeros(3,part);
%Predefino las dimensiones de la matriz v
v=zeros(3,part);
%BUCLE PARTICULA
  for k=1:1:part
    %BUCLE COMPONENTE
    for h=1:1:3
        %La particula sigue un movimiento parabolico.
        r(h,k)=r_0(h,k)+v0(h,k)*tI+(1/2)*(F(:,h)/m)*tI^2;
        %La velocidad aumenta con la aceleración.
        v(h,k)=v0(h,k)+(F(:,h)/m)*tI;
    end
  end
end
