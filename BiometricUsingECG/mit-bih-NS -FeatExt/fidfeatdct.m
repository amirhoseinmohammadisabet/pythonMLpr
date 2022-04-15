function [FEATDCT] = fidfeatdct(fs,arz,samnum,lengsig,pernum,ecgsig)
    %fs=250;
    for n=1:pernum
        ecgsigL=ecgsig(n,1:lengsig);
    [~,qrs_i_raw,~]=pan_tompkin(ecgsigL,fs,0);
        for m=1:samnum
            mm=qrs_i_raw(m+1);
            FEATURES=ecgsigL(mm-arz:mm+arz);
            y=dct(FEATURES);
            FEATDCT{1}(n,m)= y(1); 
            FEATDCT{2}(n,m)= y(2);
            FEATDCT{3}(n,m)= y(3);
            FEATDCT{4}(n,m)= y(4);
            FEATDCT{5}(n,m)= y(5);
            FEATDCT{6}(n,m)= y(6);
            FEATDCT{7}(n,m)= y(7);
        end
    end
end