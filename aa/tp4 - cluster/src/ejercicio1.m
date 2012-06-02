%ejercicio 1
format longG; % 'complete' number represetation
names=load('data\citynames.mat');
names=names.citynames;
cities=load('data\ciudadesEspanolas.txt');

%componenetes principales -> quedan 2 primeras variables
[coeff,score,latent,tsquare]=princomp(cities);

cumsum(latent)./sum(latent);

s=[1:3];
%labels= {'población','var-muj','ext-espa','tamaño','desocupados','tel','vehiculos','of.banc','precio vivienda'};
%biplot(coeff(:,s),'scores',score(:,s),'varlabels',labels);
%title('Componentes principales - ciudades españolas');
%print('-dpng','img\e1biplot.png');

% del biplot queda población, vehiculo, teléfono

cluster=kmeans(cities,3)
p1=find(cluster==1);
p2=find(cluster==2);
p3=find(cluster==3);

s1=size(p1,1)
s2=size(p2,1)
s3=size(p3,1)

names(p1) % Madrid y Barcelona
mean(cities(p1,1))
mean(cities(p2,1))
mean(cities(p3,1))
std(cities(p1,1))
std(cities(p2,1))
std(cities(p3,1))
