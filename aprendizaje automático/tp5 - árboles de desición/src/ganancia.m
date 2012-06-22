function g=ganancia(e,i,p)
    g= e-p(1)*i(1)-p(2)*i(2);
    if(g<=5.5511e-016)
        g=0;
    end
end


