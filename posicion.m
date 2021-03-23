function [r,v]=posicion(r0,v0,t,t0,F,m)
%Esta funcion calcula la posicion y la velocida en el instante t
%v0,r0,F deben ser definidas como vectores en horizontal v=[ ]
    for i=1:1:3
        r(:,i)=r0(:,i)+v0(:,i)*(t+t0)+0.5*(F(:,i)/m)*(t+t0)^2;
        v(:,i)=v0(:,i)+(F(:,1)/m)*(t+t0);
    end
    disp(r);
    disp(v);
end
