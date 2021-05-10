function [v_n,E_n]=inelastica(v,m,E)
  %Calculamos el incremento de energía con respecto a la antigua.
    inc_E=10*1.60e-19;
  %Calculamos el modulo de la nueva velocidad.
    mod_v=(dot(v,v)-(2/m)*inc_E)^(1/2); 
  %Calculamos la nueva dirección de la velocidad:
    coseno_tita=1-2*rand;
    sen_tita=(1-coseno_tita^2)^(1/2);
    fi=2*pi*rand;
  %Calculamos las componentes de la nueva velocidad
    v_n=zeros(3,1);
    v_n(1,:)=mod_v*sen_tita*sin(fi);
    v_n(2,:)=mod_v*sen_tita*cos(fi);
    v_n(3,:)=mod_v*coseno_tita;
  %Calculamos la nueva energía de la particula tras el choque:
    E_n=(1/2)*m*mod_v^2;
end