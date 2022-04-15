% pernum is number of ecg in order of 1,2,3,... you wish to give as input
% lengsig is number of points you need to extract from main file(depends on length of .mat file)
function [ecgsig] = ecgin(pernum,lengsig)
%     pernum=18;lengsig=65000;
    ecgsig = zeros(pernum,lengsig); 
    for i=1:pernum
        y= [num2str(i) '.dat'];
        x=fread(fopen(y));
        xx1=x(1:3:length(x));
        int=x(2:3:length(x));
        a2=rem(int,16)*256;
        x1=xx1+a2;
        xx=(x1(1:lengsig))';
        ecgsig(i,:) = xx(1,:);  
    end
end