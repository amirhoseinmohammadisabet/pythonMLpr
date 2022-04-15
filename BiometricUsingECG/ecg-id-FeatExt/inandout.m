clc;
clear all;
pernum=45;
st1=9;st2=17;
load ind_mit2019
InG = ind_mit2019;
L = length(InG);
Lr = randperm(L);
Lr = Lr(1:pernum);
store=[];

for i = 1:pernum
    ni = Lr(i);
    fname = sprintf('a%.0f.mat',InG(ni));
    si = load(fname);
    ai = struct2cell(si);
    di = cell2mat(ai);
    di=di(1:500000);
    store(:,i)= di;
end
nerkh=500;
lengsig=length(store);
ecgsig=store';
fs=250;arz=50;samnum=1000;
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
csvwrite('ecgidoutnorm45.csv',ecgoutnormal);
ls=linspace(1,lengsig,lengsig);plot(ls,ecgsig(1:3,:))
% T=table(ecgouttext);
% writetable(T,'tabledata.txt');