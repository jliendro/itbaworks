dialects=load('data\dialects.mat');
dialects=dialects.A_pastespecial;


labels={'A - Nottinghamshire','B - Nottinghamshire','C - Nottinghamshire',...
    'D - Lincolnshire','F - Lincolnshire','G - Lincolnshire','H - Lincolnshire',...
    'I - Lincolnshire','J - Lincolnshire','K - Lincolnshire','L - Lincolnshire',...
    'M - Leicestershire','N - Leicestershire','O - Leicestershire',...
    'P - Leicestershire','Q - Rutland','R - Northamptonshire',...
    'S - Northamptonshire','T - Northamptonshire','U - Northamptonshire',...
    'V - Huntingdonshire','W - Cambridgeshire','X - Buckinghamshire',...
    'Y - Bedfordshire'};

methods={'single','complete','average','complete','weighted'};
distances={'euclidean','seuclidean','cityblock','minkowski','chebychev',...
    'cosine','correlation','spearman','hamming','jaccard'};

for i=1:size(distances,2)
    distance=distances{i};
    for j=1:size(methods,2)
        method=methods{j};
        thistitle=strcat('Dendogram --( distance:',distance,' method: ',method, ')');
        
         
        Y=pdist(dialects,distance);
        Z=linkage(Y,method);
        t = .5*(max(Z(:,3))); % dendogram plot threshold
        figure;[H,T]=dendrogram(Z,'colorthreshold',t,'labels',labels, 'Orientation','left');
        set(H,'LineWidth',3) 
        title(thistitle);
    end
end
