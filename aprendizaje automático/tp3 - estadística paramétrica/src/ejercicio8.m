clc

load hald;
[coeff,score,latent,tsquare]=princomp(ingredients)


%latent - autoValores - varianzas

cumsum(latent)./sum(latent)

labels={'x1','x2','x3','x4'};
biplot(coeff(:,1:2),'scores',score(:,1:2),'varlabels',labels);

title('Componentes principales');
print('-dpng','ejercicio8-biplot.png');
