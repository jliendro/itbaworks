% DOC: Filmina 3a
% load data
load fisheriris;
iris = dataset({nominal(species),'especie'},... 
   {meas,'largo_sepalo','ancho_sepalo','largo_petalo','ancho_petalo'}); 

g1=find([iris.especie]=='virginica');
g2=find([iris.especie]=='versicolor');
g3=find([iris.especie]=='setosa');

g1max=max([g1]);
g1min=min([g1]);

g2max=max([g2]);
g2min=min([g2]);

g3max=max([g3]);
g3min=min([g3]);

process1(meas,g1min,g1max);
process1(meas,g2min,g2max);
process1(meas,g3min,g3max);


