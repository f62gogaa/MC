function [E_n,v_n]=inelastica(v,m,E)
  %Calculamos el incremento de energía con respecto a la antigua.
    inc_E=seccion2(E);
  %Calculamos el modulo de la nueva velocidad.
    mod_v=(norm(v)^2-(2/m)*inc_E)^(1/2);
  %Calculamos la nueva dirección de la velocidad:
    cose(tita)=1-2*rand;
    sen(tita)=(1-cose(tita)^2)^(1/2);
    fi=2*pi*rand;
  %Calculamos las componentes de la nueva velocidad
    v_n=zeros(3,1);
    for h=1:1:3
        v_n(h,:)=mod_v;
    end
  %Calculamos la nueva energía de la particula tras el choque:
    E_n=(1/2)*m*mod_v^2;
end