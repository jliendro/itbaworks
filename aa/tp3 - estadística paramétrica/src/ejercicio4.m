data=[
1.350	,8.100;     %1
465.000	,423.000;
36.33	,119.500;
27.660	,115.000;
1.040	,5.500;     %5
11700.000 ,50.000;
2547.000 ,4603.000;
187.100	,419.000;
521.000	,655.000;
10.000	,115.000;   %10
3.300	,25.600;
529.000	,680.000;
207.000	,406.000;
62.000	,1320.000;  %14 humanos
6654.000 ,5712.000; %15 elefantes
9400.000 ,70.000;
6.800	,179.000;
35.000	,56.000;
0.120	,1.000;
0.023	,0.400;     %20
2.500	,12.100;
55.500	,175.000;
100.000	,157.000;
52.160	,440.000;
87000.000 ,154.500; %25 dinosaurios
0.280	,1.900;
0.122	,3.000;
192.000	,180.000;   %28
];

corrcoef(data)

body=data(:,1);
brain=data(:,2);


bodys=data([14,15,25],1);
brains=data([14,15,25],2);

plot(body,brain,'og',bodys,brains,'*r');

legend('Datos','Especiales(humano,elefante,dinosaurio)','Location','B');
xlabel('Tamaño de cuerpo [Kg]'); 
ylabel('Tamaño de cerebro [g]'); 
title('Cuerpo vs Cerebro');
print('-dpng','ejercicio4a.png');

data = log(data);
corrcoef(data)

body=data(:,1);
brain=data(:,2);


bodys=data([14,15,25],1);
brains=data([14,15,25],2);

plot(body,brain,'og',bodys,brains,'*r');
hold on;


 
stats = regstats(data(:,2),data(:,1));

stats.beta
sum(stats.r.^2)
stats.mse

plot(body,stats.yhat,'-b');
legend('Datos','Especiales(humano,elefante,dinosaurio)','Recta de regresión','Location','B');
xlabel('log(Tamaño de cuerpo [Kg])'); 
ylabel('log(Tamaño de cerebro [g])'); 
title('Cuerpo vs Cerebro - Transformación logarítmica');
print('-dpng','ejercicio4c.png');

figure;

data=[
1.350	,8.100;     %1
465.000	,423.000;
36.33	,119.500;
27.660	,115.000;
1.040	,5.500;     %5
11700.000 ,50.000;
2547.000 ,4603.000;
187.100	,419.000;
521.000	,655.000;
10.000	,115.000;   %10
3.300	,25.600;
529.000	,680.000;
207.000	,406.000;
9400.000 ,70.000;
6.800	,179.000;
35.000	,56.000;
0.120	,1.000;
0.023	,0.400;     %20
2.500	,12.100;
55.500	,175.000;
100.000	,157.000;
52.160	,440.000;
0.280	,1.900;
0.122	,3.000;
192.000	,180.000;   %28
];

data = log(data);

corrcoef(data)

body=data(:,1);
brain=data(:,2);

plot(body,brain,'og');
hold on;

stats = regstats(data(:,2),data(:,1));

stats.beta
sum(stats.r.^2)
stats.mse

plot(body,stats.yhat,'-b');
legend('Datos','Recta de regresión','Location','B');
xlabel('log(Tamaño de cuerpo [Kg])'); 
ylabel('log(Tamaño de cerebro [g])'); 
title('Cuerpo vs Cerebro - Transformación logarítmica');
print('-dpng','ejercicio4d.png');








