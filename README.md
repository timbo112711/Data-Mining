


# Group Best Practices

### 1) Use Italics for Variable Names when writing about them. 

### 2) Screenshot and email teammates all submissions you make.

### 3) Use this structure for importing you variables when using SciKit and Tensorflow models.
```
import pandas as pd
import numpy as np

train = pd.read_csv('../data/train.csv')
test = pd.read_csv('../data/test.csv')


# _r are tRaining variables
x_r = train.drop('income_binary',1)
x_r = pd.get_dummies(x_r).values
y_r = train.income_binary.values
# _e are tEst variables
x_e = test.drop('income_binary',1)
x_e = pd.get_dummies(x_e).values
y_e = test.income_binary.values
```
```
from sklearn.model_selection import StratifiedKFold

if 'income_binary' in df:
    y = df['income_binary'].values #get values we need 
    del df['income_binary']        #get rid of the class label
    X = pd.get_dummies(df).values  #use everything else to predict 
    
# stratified K Fold
skf = StratifiedKFold(n_splits=10, random_state=111)
skf.get_n_splits(X, y)
```
## Kouvaris, Freeman, Fasere, McWilliams 2017 Fall Group Hub

* Request Slack Access if you lose it!


* [Syllabus](https://github.com/htpeter/pdti_DataMining/blob/master/Course%20Materials/Syllabus.pdf)
* [Programming Cheat Sheets]()


