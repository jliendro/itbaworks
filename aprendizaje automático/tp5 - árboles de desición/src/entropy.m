function e=entropy(s)
    cs=sum(s);
    p1=(s(1)/cs);
    p2=(s(2)/cs);
    e=-p1*mylog2(p1)-p2*mylog2(p2);
end


function l=mylog2(n)
    if(n==0)
       l=0;
    else
        l=log2(n);
    end
end