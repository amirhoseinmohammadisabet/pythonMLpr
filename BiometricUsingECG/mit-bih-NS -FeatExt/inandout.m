clc;
clear all;
pernum=18;
nerkh=140;
lengsig=7000;
ecgsig=ecgin(pernum,lengsig);
fs=250;arz=50;samnum=50;
ecgsigex=ecgsig(1,:);
numofparts=lengsig/nerkh;

[feat] = nonfidfeat(nerkh,lengsig,ecgsig);
[FEAT] = fidfeat(fs,arz,samnum,lengsig,pernum,ecgsig);
[FEATDCT] = fidfeatdct(fs,arz,samnum,lengsig,pernum,ecgsig);
[FEATDCT2] = fidfeatdct2(fs,arz,samnum,lengsig,pernum,ecgsig);

allper1 = allperson(pernum,numofparts,feat);
allper2 = allperson(pernum,samnum,FEAT);
allper3 = allperson(pernum,samnum,FEATDCT);
allper4 = allperson(pernum,samnum,FEATDCT2);
allper=vertcat(allper1,allper2,allper3,allper4);
Xtrain=vertcat(allper1(1:7,:),allper2(1:7,:),allper3(1:7,:),allper4(1:7,:));
Ytrain=allper1(8,:);
ecgout=(vertcat(Xtrain,Ytrain))';
csvwrite('ecgout.csv',ecgout);
ecgoutnorm = normalize(ecgout(:,1:28),'range');
ecgoutnormal=horzcat(ecgoutnorm,ecgout(:,29));
csvwrite('mit-bihoutnorm18.csv',ecgoutnormal);
ls=linspace(1,7000,7000);plot(ls,ecgsig(1:3,:))
% T=table(ecgouttext);
% writetable(T,'tabledata.txt');