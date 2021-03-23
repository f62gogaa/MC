%Defino parametros externos.
%Presion en Torr
P=input('Presion del sistema (en Torr)');
%Temperatura en Kelvin
T=input('Temperatura del sistema (en Kelin)');
%La energía va en eV.
E=input('Valor del campo electrico aplicado(vector fila, en eV)');
%Es la misma posición inicial para todas las partículas.
r0=input('Posicion inicial (vector fila)');
%La velocidad la voy a definir con una distribución Maxwelliana de
%velocidades (cada particula tendrá una.
v0=input('Velocidad inicial (vector fila)');
%Para todas las partícula será el mismo tiempo de inicio.
t0=input('instante inicial (vector fila)');
%Numero de particulas que participan en mi simulacion.
part=input('Número de partículas en la simulación');
%Energía máxima que va a poder tener mi sistema.
E_max0=input('Energia máxima de mi sistema');


    