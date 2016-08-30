
# coding: utf-8

# # http://jsideas.net/ pandas tutorial

# In[2]:

import pandas as pd 

data = pd.read_csv('C:/Users/Dongwoon/Dropbox/공부할거/코딩/파이썬/pandas/convenient_store.csv')   #csv를 dataframe 형태로 불러옴
data.head(10)    # 괄호 안에 있는 수 만큼 row 보여줌
data.info()      # data 정보 알려줌


# - class 'pandas.core.frame.DataFrame' : data의 class는 dataframe임
# - 177 entries : row(observation) = 177
# - Data columns : column 이름들 
# - object, int64 : data type

# In[3]:

data.area          #area column의 data 줘
data.company       #company column의 data 줘
data.describe()    #숫자인 친구들 간단한 통계값 보여줘
data.hourly_wage.describe()  #hourly_wage column의 간단한 통계값 보여줘


# In[4]:

data[data.hourly_wage > 6000]    # data에 필터 적용, dataframe이라서 [] 사용
data[((data.area1 == '마포구') | (data.area1=='강남구')) & (data.hourly_wage > 6000)]  # 괄호, &, | 로 복잡한 필터
cu = data[data.company.str.contains('CU')]


# In[5]:

data['Seoul'] = 'in seoul'  #새 column 'Seoul' 추가


# In[14]:

def more_than_6000(x):      #함수 하나 정의해보자
  if x > 6000:
    return 1
  else:
    return 0

data['more_than_6000'] = data.hourly_wage.map(lambda x: more_than_6000(x))


# map(f,x) : f(x)를 return<br />
# 따라서 data['more_than_6000'] = data.hourly_wage.map(lambda x: more_than_6000(x)) 해석해보면
# - more_than_6000 column을 만들껀데, 
# - data.hourly_wage랑 map 할거다(x로 data.hourly_wage를 쓸거다)
# - 이 때 f로는 lambda 써서 map 해라

# In[15]:

data   #새로운 column 추가 확인


# In[44]:

data2 = data[(data.hourly_wage>6300)&(data.name=='CU')][['area1', 'hourly_wage']]  # 불러올 조건 지정 + 불러올 column 지정
data2


# In[45]:

data2.to_csv('data2.csv', index=False)    # index=False : dataframe의 index column(첫 번째 column)은 뺄거야

