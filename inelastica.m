function [E_n,v_n]=inelastica(v,m)
    cose(tita)=1-2*rand;
    sen(tita)=(1-cose(tita)^2)^(1/2);
    fi=2*pi*rand;
    a=(v(:,2)^2+v(:,3)^2)^(1/2);
    v_n(:,1)=v(:,1)*cose(tita)+a*sin(fi)*sen(tita);
    v_n(:,2)=v(:,2)*cose(tita)-((v(:,3)*norm(v))/a)*cos(fi)*sen(tita)-((v(:,2)*v(:,1))/a)*sin(fi)*sen(tita);
    v_n(:,3)=v(:,3)*cose(tita)+((v(:,2)*norm(v))/a)*cos(fi)*sen(tita)-((v(:,3)*v(:,1))/a)*sin(fi)*sen(tita);
    E_n=energia(v_n,m);
end
