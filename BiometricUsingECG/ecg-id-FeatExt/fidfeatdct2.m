function [FEATDCT2] = fidfeatdct2(fs,arz,samnum,lengsig,pernum,ecgsig)
    %fs=250;
    for n=1:pernum
        ecgsigL=ecgsig(n,1:lengsig);
    [~,qrs_i_raw,~]=pan_tompkin(ecgsigL,fs,0);
        for m=1:samnum
            mm=qrs_i_raw(m+1);
            FEATURES=ecgsigL(mm-arz:mm+arz);
            y=dct(FEATURES);
            FEATDCT2{1}(n,m)= y(8); 
            FEATDCT2{2}(n,m)= y(9);
            FEATDCT2{3}(n,m)= y(10);
            FEATDCT2{4}(n,m)= y(11);
            FEATDCT2{5}(n,m)= y(12);
            FEATDCT2{6}(n,m)= y(13);
            FEATDCT2{7}(n,m)= y(14);
        end
    end
end