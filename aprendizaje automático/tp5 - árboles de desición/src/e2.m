s2=entropy([3,1])

ghumedad=ganancia(s2,[entropy([1,0]),entropy([2,1])],[1/4,3/4])
gviento =s2-1*entropy([3,1]);
gagua   =ganancia(s2,[entropy([2,1]),entropy([1,0])],[3/4,1/4]);
gtiempo =ganancia(s2,[entropy([2,0]),entropy([1,1])],[2/4,2/4]);
gcielo  =ganancia(s2,[entropy([3,0]),entropy([0,1])],[3/4,1/4]);

ssoleado = entropy([2,3])
%sshumedad= ganancia()