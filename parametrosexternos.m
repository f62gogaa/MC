function [P,T,E,r0,t0,E_max0,part,R,inter_max]=parametrosexternos()
    %Uso clear para limpiar el WORKspace de variables guardadas.
    clear
    %Defino parametros externos.
    %Presion en Torr
    P=input('Presion del sistema (en Torr)');
    %Temperatura en Kelvin
    T=input('Temperatura del sistema (en Kelin)');
    %El valor del campo electrico va en eV.
    E=input('Valor del campo electrico aplicado(vector fila, en eV)');
    %Es la misma posición inicial para todas las partículas.
    r0=input('Posicion inicial (vector fila)');
    %Para todas las partícula será el mismo tiempo de inicio.
    t0=input('instante inicial');
    %Numero de particulas que participan en mi simulacion.
    part=input('Número de partículas en la simulación');
    %Energía máxima que va a poder tener mi sistema.
    E_max0=input('Energia máxima de mi sistema');
    %Constante de los gases ideales en eV/molK.
    R=5.1899e19;
    %Numero maximo de interacciones.
    inter_max=input('numero maximo de interaciones');
end



    