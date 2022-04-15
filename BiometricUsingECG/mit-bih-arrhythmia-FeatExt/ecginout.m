clear all;clc
numofindividual=48;lengsig=65000;
ecgsig = zeros(numofindividual,lengsig); 
for i=1:numofindividual
    y= [num2str(i) '.dat'];
    x=fread(fopen(y));
    xx1=x(1:3:length(x));
    int=x(2:3:length(x));
    a2=rem(int,16)*256;
    x1=xx1+a2;
    xx=(x1(1:lengsig))';
    ecgsig(i,:) = xx(1,:);  
%     plot(xx);hold on
end
ecgsigex=ecgsig(1,:);

