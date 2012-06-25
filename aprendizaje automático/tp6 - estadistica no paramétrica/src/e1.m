clc;clear;
load fisheriris;
% species meas

% punto a
n=size(meas,1)
group=species;
sample=meas(:,1:2);
training=meas(:,1:2);
distance='euclidean';

j=1;
for i=0.1:0.02:1
    k(j)=round(i*n);
    c=knnclassify(sample,training,group,k(j),distance);
    mistake(j)=size(find(strcmp(c,species)==0),1);
    correct(j)=(n-mistake(j))/n;
    error=mistake(j)/n;   
    j=j+1;
end

plot(k,correct,'r')
hold on;

%punto b

n=size(meas,1)
group=species;
sample=meas(:,3:4);
training=meas(:,3:4);
distance='euclidean';

j=1;
for i=0.1:0.02:1
    k(j)=round(i*n);
    c=knnclassify(sample,training,group,k(j),distance);
    mistake(j)=size(find(strcmp(c,species)==0),1);
    correct(j)=(n-mistake(j))/n;
    error=mistake(j)/n;
    j=j+1;
end

plot(k,correct,'b')
hold on;

%punto c

n=size(meas,1)
group=species;
sample=meas;
training=meas;
distance='euclidean';

j=1;
for i=0.1:0.02:1
    k(j)=round(i*n);
    c=knnclassify(sample,training,group,k(j),distance);
    mistake(j)=size(find(strcmp(c,species)==0),1);
    correct(j)=(n-mistake(j))/n;
    error=mistake(j)/n;
    j=j+1;
end

plot(k,correct,'g');
hold on;

title({'Porcentaje de clasificaciones correctas';'método de k-vecinos'});
xlabel('k - cantidad de vecinos');
ylabel('clasificaciones incorrectas');
legend('ancho y largo de sépalos','ancho y largo de pétalos','4 variables','Location','Southwest');

