function [P,T,E,r0,t0,E_max0,part,R,inter_max,n_save]=parametrosexternos()
    %Uso clear para limpiar el WORKspace de variables guardadas.
    clear
    %Defino parametros externos.
    %Presion en Torr
    p=input('Presion del sistema (en Torr): ');
    %Paso a pascales
    P=p*133322;
    %Temperatura en Kelvin
    T=input('Temperatura del sistema (en Kelin): ');
    %El valor del campo electrico va en eV.
    e=input('Valor del campo electrico aplicado(vector fila, en Td): ');
    %Paso a Vm^2
    E=1e-21.*e;
    %Es la misma posición inicial para todas las partículas.
    r0=input('Posicion inicial (vector fila, en metros): ');
    %Para todas las partícula será el mismo tiempo de inicio.
    t0=input('instante inicial, en segundos: ');
    %Numero de particulas que participan en mi simulacion.
    part=input('Número de partículas en la simulación: ');
    %Energía máxima que va a poder tener mi sistema.
    E_max0=input('Energia máxima de mi sistema, en eV: ');
    %Constante de Boltzmann en J/K=Pa*m^2/K.
    R=1.380649e-23;
    %Numero maximo de interacciones.
    inter_max=input('numero maximo de interaciones: ');
    %Cada cuantas interacciones se guardaran datos
    n_save=input('Guardará datos cada ... interacciones: ');
end



    