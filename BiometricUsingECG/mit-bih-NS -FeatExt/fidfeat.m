function [FEAT] = fidfeat(fs,arz,samnum,lengsig,pernum,ecgsig)
    %fs=250;
    for n=1:pernum
        ecgsigL=ecgsig(n,1:lengsig);
    [~,qrs_i_raw,~]=pan_tompkin(ecgsigL,fs,0);
        for m=1:samnum
            mm=qrs_i_raw(m+1);
            FEATURES=ecgsigL(mm-arz:mm+arz);
            FEAT{1}(n,m)= medfreq(FEATURES); 
            FEAT{2}(n,m)= mean(abs(FEATURES));
            FEAT{3}(n,m)= obw(FEATURES);
            FEAT{4}(n,m)= skewness(FEATURES);
            FEAT{5}(n,m)= var(FEATURES);
            FEAT{6}(n,m)= max(FEATURES);
            FEAT{7}(n,m)= min(FEATURES);
        end
    end
end