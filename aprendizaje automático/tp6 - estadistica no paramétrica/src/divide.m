function [sample,training,group,checkgroup] = divide( data, answer, limit)

lenght=size(data,1)
indexes=randperm(lenght);
g1=indexes(:,1:limit);
g2=indexes(:,(limit+1):lenght);

training=data(g1,:);
group=answer(g1,:);

size(training)
size(group)

sample=data(g2,:);
checkgroup=answer(g2,:);

end

