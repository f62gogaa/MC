%Comienzo llamando al BLOQUE1 para que se definan las variables que
%necesito durante toda la simualcion y que no se generan en ella.
BLOQUE1
%A continuacion llamo a recopilacion de datos (dentro se encuentra el
%programa que hace evolucionar a las particulas y calcula los choque. Este
%archivo esta dentro de un bucle con un contador que a las x interacciones
%sale para realizar "check", "representar" o "dar error" según lo que halla
%pasado dentro de este.
inter=10;
while z<inter
    Recopilacion;
    z=z+1;
end
while (c=1)&&(C=2)
