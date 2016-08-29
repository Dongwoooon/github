
# coding: utf-8

# In[13]:

import pandas as pd 

data = pd.read_csv('C:/Users/Dongwoon/Dropbox/공부할거/코딩/파이썬/pandas/convenient_store.csv')   #csv를 dataframe 형태로 불러옴
data.head(10)    # 괄호 안에 있는 수 만큼 row 보여줌
data.info()      # data 정보 알려줌


# <class 'pandas.core.frame.DataFrame'> : data의 class는 dataframe임
# 177 entries : row(observation) = 177
# Data columns : column 이름들 
# object, int64 : data type

# In[18]:

data.area          #area column의 data 줘
data.company       #company column의 data 줘
data.describe()    #숫자인 친구들 간단한 통계값 보여줘
data.hourly_wage.describe()  #hourly_wage column의 간단한 통계값 보여줘

