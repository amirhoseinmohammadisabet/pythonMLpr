clc;clear all
ecgoutnorm = readmatrix('mit-bih-AR48.csv');
X=ecgoutnorm(:,1:28);Y=ecgoutnorm(:,29);
oo=1;
% % Holdout CrossValidation
% 
% tbl = array2table(X);
% tbl.Y = Y;
% rng('default') % For reproducibility
% n = length(tbl.Y);
% c = cvpartition(n,'Holdout',i);
% treeholdoutmodel = fitctree(X,Y,'CVPartition',c);
% trainError = kfoldLoss(treeholdoutmodel);
% holdoutDTAccuracy = (1-trainError)*100



% % Kfold CrossValidation

rng('default') % For reproducibility
c = cvpartition(Y,'KFold',5);
treekfoldmodel=fitctree(X,Y,'CVPartition',c);
treeRate = kfoldLoss(treekfoldmodel);
KfoldDTAccuracy = (1-treeRate)*100

% view(model,'mode','graph')

