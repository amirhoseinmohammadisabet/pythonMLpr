function [allper] = allperson(pernum,numofparts,feat)
for b=1:pernum
    bb =b* ones(1,numofparts);
    bbb=pesronize(b,numofparts,feat);
    bbbb = vertcat(bbb,bb);
    person{b}= bbbb;
end
allper=person{1};
for k=2:pernum
    allper = horzcat(allper,person{k});
end

end