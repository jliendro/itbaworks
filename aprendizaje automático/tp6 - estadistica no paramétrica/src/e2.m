clc;
clear;

autos=load('data\autos.txt');
% auto velocidad distancia
x=autos(:,2);
y=autos(:,3);

r=ksrlin(x,y)

% punto a
% regresi�n lineal pesada con n�cleo gaussiano
plot(x,y,'ro',r.x,r.f,'b');

title('Distancia de frenado en funci�n de la velocidad de un auto - 1920');
xlabel('velocidad [millas/h]');
ylabel('distancia de frenado [pies]');
legend('datos','regresi�n lineal local pesada con n�cleo gaussiano','Location','Northwest');

% punto b
% n�cleo tricubo

figure;
plot(x,y,'ro');
hold on;
lengthdata=size(y,1);

colors={'g','m','c','k','r'};
colorsize=size(colors,2)

start=1;
step=10;
stop=41;

for i=start:step:stop
    spanvalue=i/lengthdata;
    span=ceil(spanvalue*length(y));
    z=smooth(x,y,span,'lowess');
    c=mod(round(i/step),colorsize)+1
    plot(x,z,colors{c});
    hold on;
end

l{1}='datos';

for i=start:step:stop    
    j=round(i/step)+2
    l{j}=strcat(num2str(i),' vecinos');
end

legend(l);

title({'Distancia de frenado en funci�n de la velocidad de un auto - 1920';
    'Regresi�n lineal local pesada con n�cleo tricubo'});
xlabel('velocidad [millas/h]');
ylabel('distancia de frenado [pies]');

