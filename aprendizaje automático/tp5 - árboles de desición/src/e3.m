load fisheriris;

x=meas(:,1:2);
t = classregtree(x,species,'method','classification','names',{'ls' 'as'},'splitcriterion','gdi');
view(t);
sfit= eval(t,x);
mean(strcmp(sfit,species))

x=meas(:,3:4);
t = classregtree(x,species,'method','classification','names',{'largo p�talo' 'ancho p�talo'},'splitcriterion','gdi');
view(t);
sfit= eval(t,x);
mean(strcmp(sfit,species))

x=meas;
t = classregtree(x,species,'method','classification','names',{'largo s�palo' 'ancho s�palo' 'largo p�talo' 'ancho p�talo'},'splitcriterion','gdi');
view(t);
sfit= eval(t,x);
mean(strcmp(sfit,species))