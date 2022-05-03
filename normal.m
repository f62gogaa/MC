function [f_dis,energy_eV]=normal(hist,energy,delta)
%Esta función obtiene los datos de la función de distribución del
%histograma y los normaliza.
%Primero pasa los valores de energía de J a eV.
energy_eV=energy/1.60e-19;
deltau=delta/1.60e-19;
%Ahora obtenemos los datos de la función de distribución del histograma.
f_no=hist./sqrt(energy_eV);
%Como los datos hallados son de una función de dsitribución normalizada al
%número de particulas, la normalizamos estadisiticamente.
f_dis=f_no./(deltau*sum(sqrt(energy_eV).*f_no));
end