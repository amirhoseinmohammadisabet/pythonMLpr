function [feat] = nonfidfeat(nerkh,lengsig,ecgsig)
    numofparts=lengsig/nerkh;
    for j=1:length(ecgsig(:,1))
        ii=1;
        for i=1:(numofparts)
            ecgsiglocal=ecgsig(j,:);
            iii=i*nerkh;
            features=ecgsiglocal(ii:iii);
            ii=1+(i*nerkh);
            feat{1}(j,i)= medfreq(features); 
            feat{2}(j,i)= mean(abs(features));
            feat{3}(j,i)= obw(features);
            feat{4}(j,i)= skewness(features);
            feat{5}(j,i)= var(features);
            feat{6}(j,i)= max(features);
            feat{7}(j,i)= min(features);
        end
    end
end
