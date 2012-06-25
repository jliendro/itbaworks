colesterol=load('data\colesterol.txt');
% n x y
x=colesterol(:,2);
y=colesterol(:,3);

% punto a
plot(x,y,'ro');
title('Porcentaje de acatamiento vs disminuci�n en el nivel de colesterol');
xlabel('disminuci�n de colesterol');
ylabel('porcentaje de acatamiento');

% punto b
% con la herramienta interactiva de matlab tool-> fit

% punto c
spanvalue=0.2;
span=ceil(spanvalue*length(y));
z=smooth(x,y,span,'lowess');
hold on;
plot(x,z,'bd');

hold on;
r=ksrlin(x,y)

hold on;
plot(r.x,r.f,'g+');
legend('datos', strcat('regresi�n lineal pesada - span: ',num2str(spanvalue)),'regresi�n lineal pesada - n�cleo gaussiano','Location','NorthWest');