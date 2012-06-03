congress=load('data\congresistasNJ.txt');
politicalgroup=load('data\politicalgroup.mat');
politicalgroup=politicalgroup.politicalgroup;

classes=unique(politicalgroup);

methods={'single','complete','average','complete','weighted'};
distances={'euclidean','seuclidean','cityblock','minkowski','chebychev',...
     'cosine','correlation','spearman','hamming','jaccard'};
 
data=congress;
index=[1,1];
minerror=intmax('uint32');

for i=1:size(distances,2)
    distance=distances{i};
    for j=1:size(methods,2)
        method=methods{j};
        Y=pdist(data,distance);
        Z=linkage(Y,method);
        T=cluster(Z,'maxclust',2);
                
        clusterversion={};
        for k=1:size(politicalgroup,1)
           clusterversion(k,1)=classes(T(k));
        end
        error=confusionmat(politicalgroup,clusterversion);
        thiserror=error(1,2)+error(2,1);
        if(thiserror<minerror)
            minerror=thiserror;
            index=[i,j];
        end
    end
end

minerror
distance=distances{index(1)}
method=methods{index(2)}

thistitle=strcat('Political Group Dendogram -->( method: ',method, ')');
Y=pdist(data,distance);
Z=linkage(Y,method);
t = .7*(max(Z(:,3))); % dendogram plot threshold
figure;[H,T]=dendrogram(Z,'colorthreshold',t,'labels',politicalgroup, 'Orientation','left');
set(H,'LineWidth',2) 
title(thistitle);
xlabel(strcat('distance:', distance));


T=cluster(Z,'maxclust',2);
clusterversion={};
for k=1:size(politicalgroup,1)
   clusterversion(k,1)=classes(T(k));
end

congressconfusion=confusionmat(politicalgroup,clusterversion)
