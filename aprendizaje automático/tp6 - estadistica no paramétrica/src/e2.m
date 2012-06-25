clc;
clear;

autos=load('data\autos.txt');
% auto velocidad distancia
x=autos(:,2);
y=autos(:,3);

r=ksrlin(x,y)

% punto a
% regresión lineal pesada con núcleo gaussiano
plot(x,y,'ro',r.x,r.f,'b');

title('Distancia de frenado en función de la velocidad de un auto - 1920');
xlabel('velocidad [millas/h]');
ylabel('distancia de frenado [pies]');
legend('datos','regresión lineal local pesada con núcleo gaussiano','Location','Northwest');

% punto b
% núcleo tricubo

figure;
plot(x,y,'ro');
hold on;
lengthdata=size(y,1);

colors={'m','g','c','r','k'};
colorsize=size(colors,2)

range=[1,5,10,30];

j=1;
for i=range
    spanvalue=i/lengthdata;
    span=ceil(spanvalue*length(y));
    z=smooth(x,y,span,'lowess');
    c=mod(j,colorsize)+1
    plot(x,z,colors{c});
    hold on;
    j=j+1;
end

l{1}='datos';
j=2;
for i=range
    %j=round(i/step)+2
    l{j}=strcat(num2str(i),' vecinos');
    j=j+1;
end

legend(l);

title({'Distancia de frenado en función de la velocidad de un auto - 1920';
    'Regresión lineal local pesada con núcleo tricubo'});
xlabel('velocidad [millas/h]');
ylabel('distancia de frenado [pies]');

