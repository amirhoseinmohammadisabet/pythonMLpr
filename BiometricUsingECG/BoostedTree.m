clc;clear all
ecgoutnorm = readmatrix('mit-bih-AR48-more.csv');
X=ecgoutnorm(:,1:28);Y=ecgoutnorm(:,29);

%Holdout CrossValidation
tbl = array2table(X);
tbl.Y = Y;
rng('default') % For reproducibility
n = length(tbl.Y);s=1;
c = cvpartition(n,'Holdout',0.21);
t = templateTree('Surrogate','on','MaxNumSplits',30,'PredictorSelection','allsplits','AlgorithmForCategorical','PCA');
modelboost = fitcensemble(X,Y,'Method','AdaBoostM2','Learners',t,'CVPartition',c);
L = kfoldLoss(modelboost);
trainAccuracyHoldout = (1-L)*100


c = cvpartition(Y,'KFold',7);
t = templateTree('Surrogate','on','MaxNumSplits',28,'PredictorSelection','allsplits','AlgorithmForCategorical','PCA');
modelboost = fitcensemble(X,Y,'Method','AdaBoostM2','Learners',t,'CVPartition',c)
L = kfoldLoss(modelboost);
trainAccuracykfold = (1-L)*100

