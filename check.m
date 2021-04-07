function [chk]=check(E0,EI,intermax,inter,limite,chk)
    if inter<intermax && (EI-E0)<limite && chk==1
        %En este caso no hemos llegado a las interacciones maximas y la
        %diferencia entre la media de la energía de todas las particulas de
        %la interacción anterior y de esta interacción es menos que el
        %limete de convergencia, luego la energía ya ha convergido y vamos
        %a volver a hacer un bucle mas de interacciones y representamos los
        %datos
        chk=1;
    elseif inter<intermax && (EI-E0)>limite
        %En este caso no hemos llegado a las interacciones maximas y la
        %diferencia entre la media de la energía de las particulas de la
        %interaccion anterior y de la actual interaccion es mayor que el
        %limete de convergencia, luego seguimos adelante con la simulacion
        %hasta que ocurra o se acaben las interacciones
        chk=2;
    end
end
