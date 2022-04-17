clc;clear all
ecgoutnorm = readmatrix('mit-bih-AR48-more.csv');
X=ecgoutnorm(:,1:28);Y=ecgoutnorm(:,29);

%Holdout CrossValidation

tbl = array2table(X);
tbl.Y = Y;
rng('default') % For reproducibility
n = length(tbl.Y);
c = cvpartition(n,'Holdout',0.3);
modelknn = fitcknn(X,Y,'NumNeighbors',1,'Standardize',1,'Distance','euclidean','CVPartition',c)
L = kfoldLoss(modelknn);
trainAccuracy = (1-L)*100


c = cvpartition(Y,'KFold',10);
modelknn = fitcknn(X,Y,'NumNeighbors',1,'Standardize',1,'Distance','euclidean','CVPartition',c)
L = kfoldLoss(modelknn);
trainAccuracy = (1-L)*100