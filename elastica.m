function [v_n,E_n]=elastica(v,E,m,M)
    E_n=(1+((2*m)/M))*E;
    for w=1:1:3
        v_n(:,w)=(1+((2*m)/M))^(1/2)*v(:,w);
    end
    