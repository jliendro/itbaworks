%s2=entropy([3,1]);

%ghumedad=ganancia(s2,[entropy([1,0]),entropy([2,1])],[1/4,3/4]);
%gviento =s2-1*entropy([3,1]);
%gagua   =ganancia(s2,[entropy([2,1]),entropy([1,0])],[3/4,1/4]);
%gtiempo =ganancia(s2,[entropy([2,0]),entropy([1,1])],[2/4,2/4]);
%gcielo  =ganancia(s2,[entropy([3,0]),entropy([0,1])],[3/4,1/4]);

% punto c - paso 1
clc;
s3 = entropy([3,2])
gs_cielo    =ganancia(s3,[entropy([3,1]),entropy([0,1])],[4/5,1/5])
gs_aire     =ganancia(s3,[entropy([3,1]),entropy([0,1])],[4/5,1/5])
gs_humedad  =ganancia(s3,[entropy([1,1]),entropy([2,1])],[2/5,3/5])
gs_viento   =ganancia(s3,[entropy([3,1]),entropy([0,1])],[4/5,1/5])
gs_agua     =ganancia(s3,[entropy([2,2]),entropy([1,0])],[4/5,1/5])
gs_tiempo   =ganancia(s3,[entropy([2,1]),entropy([1,1])],[3/5,2/5])

% punto c - paso 2
clc;
s3 = entropy([3,1])
gs_cielo    =ganancia(s3,[entropy([3,1]),entropy([0,0])],[1,0])
gs_humedad  =ganancia(s3,[entropy([1,1]),entropy([2,0])],[2/4,2/4])
gs_viento   =ganancia(s3,[entropy([3,0]),entropy([0,1])],[3/4,1/4])
gs_agua     =ganancia(s3,[entropy([2,1]),entropy([1,0])],[3/4,1/4])
gs_tiempo   =ganancia(s3,[entropy([2,1]),entropy([1,0])],[3/4,1/4])