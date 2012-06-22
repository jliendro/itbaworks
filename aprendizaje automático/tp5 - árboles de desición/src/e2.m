% data={
% 'soleado','cálida','normal','fuerte','cálida','igual','si'; 
% 'soleado','cálida','alta','fuerte','cálida','igual','si';
% 'nublado','fría','alta','fuerte','cálida','cambiante','no';
% 'soleado','cálida','alta','fuerte','fría','cambiante','si'
% };

data=[
1,2,3,7,2,9,1; 
1,2,6,7,2,9,1;
4,5,6,7,2,8,0;
1,2,6,7,5,8,1
];

t=classregtree(data(:,1:6),data(:,7),'names',{'cielo' 'aire' 'humedad' 'viento' 'agua' 'tiempo'},'method', 'classification');
view(t)
