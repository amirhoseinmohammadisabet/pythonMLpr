clc;clear all
ecgoutnorm = readmatrix('mit-bih-AR48-more.csv');
X=ecgoutnorm(:,1:28);Y=ecgoutnorm(:,29);

% %Holdout CrossValidation
tbl = array2table(X);
tbl.Y = Y;
rng('default') % For reproducibility
n = length(tbl.Y);
c = cvpartition(n,'Holdout',0.21);
t = templateTree('Surrogate','on','MaxNumSplits',100,'PredictorSelection','allsplits','AlgorithmForCategorical','PCA');
modelboost = fitcensemble(X,Y,'Method','bag','Learners',t,'CVPartition',c)
L = kfoldLoss(modelboost);
trainAccuracyholdout = (1-L)*100

c = cvpartition(Y,'KFold',10);
t = templateTree('Surrogate','on','MaxNumSplits',100,'PredictorSelection','allsplits','AlgorithmForCategorical','PCA');
modelboost = fitcensemble(X,Y,'Method','bag','Learners',t,'CVPartition',c)
L = kfoldLoss(modelboost);
trainAccuracykfold = (1-L)*100