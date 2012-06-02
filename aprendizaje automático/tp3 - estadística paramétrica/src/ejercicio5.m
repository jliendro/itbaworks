load census;

[r p]=corrcoef([cdate pop]);
% a partir del análisis de la matriz de correlación
% no existe una relación lineal entre las variables

c2=polyfit(cdate,pop,2)
c3=polyfit(cdate,pop,3)

poli2=polyval(c2,cdate)
poli3=polyval(c3,cdate)

plot(cdate,pop,'*g',cdate,poli2,'--r',cdate,poli3,'-b');
legend('habitantes','polinomio-2','polinomio-3','Location','B');
xlabel('Año'); 
ylabel('Habitantes [millones]'); 
title('Censo por década en Estados Unidos');
print('-dpng','ejercicio5.png');

% Análisis de residuos
garbage=[pop-poli2 pop-poli3];
figure;
plot(pop,garbage(:,1),'or',pop,garbage(:,2),'db',pop,zeros(size(pop)),'--g');

legend('residuo-poli-2','residuo-poli-3','Location','B') 
xlabel('Habitantes'); 
ylabel('Residuo'); 
title('Residuos de ajuste por polinomios');
print('-dpng','ejercicio5-residuos.png');

G2=sum(garbage(:,1).^2)
G3=sum(garbage(:,2).^2)

% El polinomio de grado3 tiene menor residuo

TARGET=2000;
MATCH= 281421906/10^6;

people2=polyval(c2,TARGET)
people3=polyval(c3,TARGET)

e2=people2-MATCH
e3=people3-MATCH

% e3 es más chico por lo tanto poli3 ajusta mejor



