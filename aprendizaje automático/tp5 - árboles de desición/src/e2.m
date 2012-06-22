% data={
% 'soleado','c�lida','normal','fuerte','c�lida','igual','si'; 
% 'soleado','c�lida','alta','fuerte','c�lida','igual','si';
% 'nublado','fr�a','alta','fuerte','c�lida','cambiante','no';
% 'soleado','c�lida','alta','fuerte','fr�a','cambiante','si'
% };

data=[
1,2,3,7,2,9,1; 
1,2,6,7,2,9,1;
4,5,6,7,2,8,0;
1,2,6,7,5,8,1
];

t=classregtree(data(:,1:6),data(:,7),'names',{'cielo' 'aire' 'humedad' 'viento' 'agua' 'tiempo'},'method', 'classification');
view(t)
