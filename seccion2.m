function [seccion2]=seccion2(E)
    pend=1e-22;
    if (0<=E)&&(E<=10)
        seccion2=0;
    elseif (10<E)&&(E<=20)
        seccion2=pend*E-10*pend;
    elseif (20<E)&&(E<=30)
        seccion2=10^-21;
    elseif (30<E)&&(E<=40)
        seccion2=-pend*E+40*pend;
    else
        seccion2=0;
    end
end
        
        