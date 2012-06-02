load hald;

[r] = corrcoef(ingredients)  % Compute sample correlation and p-values.
[i,j] = find(abs(r)>0.8 & ~(abs(r)==1));  % Find significant correlations.
[i,j]

% Punto a
% -------
% x4 x2 --> correlacionados
% x3 x1 --> correlacionados
% probablemente sean sólo dos variables linealmente independientes

% 1 4, 4 3, 2 3, 2 1

%[b,se,pval,inmodel,stats,nextstep,history]=stepwisefit(ingredients,heat,...
    %'penter',0.05,'premove',0.99) ;
% Esto podría ser el método de selección  hacia adelante dado que tiene un
% premove 'muy alto' 

size(ingredients)

x1=ingredients(:,1);
x2=ingredients(:,2);
x3=ingredients(:,3);
x4=ingredients(:,4);

whichstats = {'rsquare','fstat'};
stats = regstats(heat,x1,'linear',whichstats);
r1= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,x2,'linear',whichstats);
r2= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,x3,'linear',whichstats);
r3= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,x4,'linear',whichstats);
r4= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,[x4 x1],'linear',whichstats);
r41= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,[x4 x3],'linear',whichstats);
r43= [stats.rsquare,  stats.fstat.f]

stats = regstats(heat,[x4 x2],'linear',whichstats);
r42= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,[x4 x1 x2],'linear',whichstats);
r412= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,[x4 x1 x3],'linear',whichstats);
r413= [stats.rsquare,  stats.fstat.f]

whichstats = {'rsquare','fstat'};
stats = regstats(heat,[x4 x1 x2 x3],'linear',whichstats);
r4123= [stats.rsquare,  stats.fstat.f]

