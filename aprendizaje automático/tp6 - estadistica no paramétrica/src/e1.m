clc;clear;
load fisheriris;
% species meas

% punto a
[k correct]=e1helper(species,meas(:,1:2),meas(:,1:2),species);
plot(k,correct,'r')
hold on;

%punto b
[k correct]=e1helper(species,meas(:,3:4),meas(:,3:4),species);
plot(k,correct,'b')
hold on;

%punto c
[k correct]=e1helper(species,meas,meas,species);
plot(k,correct,'g');
hold on;

title({'Porcentaje de clasificaciones correctas';'m�todo de k-vecinos'});
xlabel('k - cantidad de vecinos');
ylabel('clasificaciones incorrectas');
legend('ancho y largo de s�palos','ancho y largo de p�talos',...
    '4 variables','Location','Southwest');

