function [seccion2]=seccion2(E)
    pend=1e-24;
    if (0<=E)&&(E<=10)
        seccion2=0;
    elseif (10<E)&&(E<=20)
        seccion2=pend*E;
    elseif (20<E)&&(E<=30)
        seccion2=10^-23;
    elseif (30<E)&&(E<=40)
        seccion2=-pend*E;
    else 
        seccion2=0;
    end
end
        
        