function [xrec] = ecgfilter(ECG)
    [cA,~] = dwt(ECG,'sym4');
    xrec = idwt(cA,zeros(size(cA)),'sym4');
%     plot(ECG)
%     hold on
%     grid on
%     plot(xrec)
%     legend('Original','Reconstruction')
end