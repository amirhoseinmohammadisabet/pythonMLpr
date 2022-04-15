function [person] = pesronize(p,numofparts,feat)
    featnumber=7;
    for f=1:featnumber
        for g=1:numofparts
           person(f,g)= feat{f}(p,g); 
        end
    end
end