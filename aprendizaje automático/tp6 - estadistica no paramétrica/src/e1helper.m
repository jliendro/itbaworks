function [ k correct ] = e1helper( group, sample, training, checkgroup )

    distance='euclidean';
    n=size(sample,1);
    
    j=1;
    for i=0.1:0.02:1
        k(j)=round(i*n);
        c=knnclassify(sample,training,group,k(j),distance);
        mistake(j)=size(find(strcmp(c,checkgroup)==0),1);
        correct(j)=(n-mistake(j))/n;
        error=mistake(j)/n;   
        j=j+1;
    end

end

