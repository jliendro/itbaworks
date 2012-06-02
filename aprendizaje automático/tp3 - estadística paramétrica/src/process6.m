function [] = process6( data,min,max)
    
    % ejercicio 6
    

    data=data(min:max,:);
        
    meanVector=mean(data)
    
    n=size(meanVector,2);
    mu=mean(meanVector)
    sigma= sum((meanVector-ones(1,n)*mu).^2)/n
    
        
    covMatrix=cov(data)
    sigma=covMatrix(1,1)+covMatrix(2,2)+covMatrix(3,3)+covMatrix(4,4)*(n-1)/n
   

    
end

