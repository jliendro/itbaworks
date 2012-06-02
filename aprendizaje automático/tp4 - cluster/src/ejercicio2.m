%ejercicio 3
clear all; clc;
load fisheriris;

c=kmeans(meas,3);
labels=unique(species);

kmeanscluster={};

for i=1:size(c,1)
   kmeanscluster(i,1)=labels(c(i));
end

kmeanconfusion=confusionmat(species,kmeanscluster)

methods={'single','complete','average','complete','weighted'};
distances={'euclidean','seuclidean','cityblock','minkowski','chebychev',...
     'cosine','correlation','spearman','hamming','jaccard'};

index=[1,1];
minerror=intmax('uint32');

for i=1:size(distances,2)
    distance=distances{i};
    for j=1:size(methods,2)
        method=methods{j};
        Y=pdist(meas,distance);
        Z=linkage(Y,method);
        T=cluster(Z,'maxclust',3);
                
        clusterversion={};
        for k=1:size(c,1)
           clusterversion(k,1)=labels(T(k));
        end
        error=confusionmat(species,clusterversion);
        thiserror=error(1,2)+error(1,3)+error(2,3)+error(2,1)+error(3,1)+error(3,2);
        if(thiserror<minerror)
            minerror=thiserror;
            index=[i,j];
        end
    end
end

minerror
distance=distances{index(1)}
method=methods{index(2)}

thistitle=strcat('LIRIOS Dendogram --( distance:',distance,' method: ',method, ')');
Y=pdist(meas,distance);
Z=linkage(Y,method);
t = .5*(max(Z(:,3))); % dendogram plot threshold
figure;[H,T]=dendrogram(Z,'colorthreshold',t,'labels',species, 'Orientation','left');
set(H,'LineWidth',2) 
title(thistitle);
xlabel(strcat('distance:', distance));

T=cluster(Z,'maxclust',3);
clusterversion={};
for k=1:size(c,1)
   clusterversion(k,1)=labels(T(k));
end

treeconfusion=confusionmat(species,clusterversion)


