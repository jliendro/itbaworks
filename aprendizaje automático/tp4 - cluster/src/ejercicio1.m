%ejercicio 1
clear all;clc;
format longG; % 'complete' number represetation
names=load('data\citynames.mat');
names=names.citynames;
cities=load('data\ciudadesEspanolas.txt');

%componenetes principales -> quedan 2 primeras variables
[coeff,score,latent,tsquare]=princomp(cities);

cumsum(latent)./sum(latent)
grupos=3;
s=[1:grupos];
labels= {'población','var-muj','ext-espa','tamaño','desocupados','tel','vehiculos','of.banc','precio vivienda'};
biplot(coeff(:,s),'scores',score(:,s),'varlabels',labels);
title('Componentes principales - ciudades españolas');
print('-dpng','img\e1biplot.png');

% del biplot queda población, vehiculo, teléfono

cluster=kmeans(cities,grupos);
p1=find(cluster==1);
p2=find(cluster==2);
p3=find(cluster==3);

names(p1); % más numeroso 
names(p2); % medio
names(p3); % Madrid y Barcelona

s1=size(p1,1)
[s1,mean(cities(p1,1)),std(cities(p1,1))]
[s1,mean(cities(p1,6)),std(cities(p1,6))]
[s1,mean(cities(p1,7)),std(cities(p1,7))]



s2=size(p2,1)
[s2,mean(cities(p2,1)),std(cities(p2,1))]
[s2,mean(cities(p2,6)),std(cities(p2,6))]
[s2,mean(cities(p2,7)),std(cities(p2,7))]


s3=size(p3,1)
[s3,mean(cities(p3,1)),std(cities(p3,1))]
[s3,mean(cities(p3,6)),std(cities(p3,6))]
[s3,mean(cities(p3,7)),std(cities(p3,7))]

