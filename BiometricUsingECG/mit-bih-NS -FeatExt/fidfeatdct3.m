function [FEATDCT3] = fidfeatdct3(fs,arz,samnum,lengsig,pernum,ecgsig)
    %fs=250;
    for n=1:pernum
        ecgsigL=ecgsig(n,1:lengsig);
    [~,qrs_i_raw,~]=pan_tompkin(ecgsigL,fs,0);
        for m=1:samnum
            mm=qrs_i_raw(m+1);
            FEATURES=ecgsigL(mm-arz:mm+arz);
            y=dct(FEATURES);
            FEATDCT3{1}(n,m)= y(15); 
            FEATDCT3{2}(n,m)= y(16);
            FEATDCT3{3}(n,m)= y(17);
            FEATDCT3{4}(n,m)= y(18);
            FEATDCT3{5}(n,m)= y(19);
            FEATDCT3{6}(n,m)= y(20);
            FEATDCT3{7}(n,m)= y(21);
        end
    end
end