function [A,B,C] = process1( data,min,max)
    
    % NOTA: En todos los siguientes ejercicios se considera una distribución
    % normal(u,sigma) de los datos.

    % TODO !! Falta separar los datos por especie

    % Punto 1.A
    % ---------
    % ESTIMADORES DE MÁXIMA VEROSIMILITUD
    % (uHat,sigmaHat);

    data=data(min:max,:);
    n=size(data,1);
    
    uHat=mean(data);
    sigmaHat=(n-1)*std(data)/n;
    A=[sigmaHat uHat];
    
    

    %[media,desvio,min,max,rango,especie]=grpstats(meas,species,... 
    %  {'mean','std','min','max','range','gname'})

    % Punto 1.B
    % ---------
    % ERROR CUADRÁTICO MEDIO
    % Dado que uHat es un estimador insesgado de u, es decir bu(uHat)=0
    % entonces r(uHat,u)= sigma^2/n = ecm de uHat

    ecm=std(data).^2/n;
    B=ecm;

    % Punto 1.C
    % ---------
    % INTERVALOS DE CONFIANZA
    % percentiles Zalpha,t(n,alpha)
    % (xRaya - zalpha/2 sigma/sqrt(n),xRaya + zalpha/2 sigma/sqrt(n))
    % TODO: ¿¿ alpha / 2 ??

    mu=mean(data);
    sigma=std(data);
    p=0.05/2; % como busco a izquierda y no a derecha uso (1-0.95)
            % TODO aca tengo que dividir por 2 ??
            
    %USAR T STUDENT
    % Opcion A: conozco sigma
    %zAlpha=norminv(p,mu,sigma);
    zAlpha=tinv(p,n-1); % FIXME !  :D

    % devuelve el percentil P de la distribución normal con media mu y desvió
    % sigma (default, mu=0, sigma=1)

    intervalo=[mu-zAlpha.*sigma/sqrt(n),mu+zAlpha.*sigma/sqrt(n)];
    C=intervalo

end

