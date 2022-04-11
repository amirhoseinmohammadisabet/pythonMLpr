# Support Vector Machine 

#1 Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from sklearn.metrics import ConfusionMatrixDisplay
from sklearn.pipeline import make_pipeline
#2 Importing the dataset
dataset = pd.read_csv('ecgidoutnorm45.csv')
X = dataset.iloc[:, [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27]].values
y = dataset.iloc[:, 28].values
a=0
#3 Splitting the dataset into the Training set and Test set
'''
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 3)
'''
#3.1 Kfold

from sklearn.model_selection import KFold # import KFold
kf = KFold(n_splits=5, random_state=1, shuffle=True) # Define the split - into 2 folds 
kf.get_n_splits(X) # returns the number of splitting iterations in the cross-validator
print(kf) 
for train_index, test_index in kf.split(X):
 X_train, X_test = X[train_index], X[test_index]
 y_train, y_test = y[train_index], y[test_index]


 from sklearn.preprocessing import StandardScaler
 sc = StandardScaler()
 X_train = sc.fit_transform(X_train)
 X_test = sc.transform(X_test)


 from sklearn.svm import SVC 
 classifier = SVC(kernel="linear",decision_function_shape='ovo', random_state=0)
 classifier.fit(X_train,y_train)

 y_pred = classifier.predict(X_test)

 from sklearn.metrics import confusion_matrix
 cm = confusion_matrix(y_test, y_pred)


 from sklearn.metrics import accuracy_score
 from sklearn.metrics import balanced_accuracy_score
 accu=accuracy_score(y_test, y_pred)
 B_accu=balanced_accuracy_score(y_test, y_pred)
 a=a+accu
b=a/kf.n_splits
print("Accuracy = ",b*100)

np.set_printoptions(precision=2)

# Plot non-normalized confusion matrix
titles_options = [
    ("Confusion matrix, without normalization", None),
    ("Normalized confusion matrix", "true"),
]
for title, normalize in titles_options:
    disp = ConfusionMatrixDisplay.from_estimator(
        classifier,
        X_test,
        y_test,
        cmap=plt.cm.Blues,
        normalize=normalize,
    )
    disp.ax_.set_title(title)

    print(title)
    print(disp.confusion_matrix)

plt.show()