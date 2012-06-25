clc;clear;
load fisheriris;
% species meas

[sample,training,group,checkgroup]=divide(meas,species,100);

% punto a
[k correct]=e1helper(group,sample(:,1:2),training(:,1:2),checkgroup);
plot(k,correct,'r')
hold on;

%punto b
[k correct]=e1helper(group,sample(:,3:4),training(:,3:4),checkgroup);
plot(k,correct,'b')
hold on;

%punto c
[k correct]=e1helper(group,sample,training,checkgroup);
plot(k,correct,'g');
hold on;

title({'Porcentaje de clasificaciones correctas';'método de k-vecinos'});
xlabel('k - cantidad de vecinos');
ylabel('clasificaciones incorrectas');
legend('ancho y largo de sépalos','ancho y largo de pétalos',...
    '4 variables','Location','Southwest');

