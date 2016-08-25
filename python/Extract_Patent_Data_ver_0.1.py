
# coding: utf-8

# # 전체 data column 구조
# 
# ## 원본 구조
# - grant_patent: id type number country date abstract title kind num_claims
# 
# 
# - grant_assignee.tsv ['id', 'type', 'name_first', 'name_last', 'organization', 'residence', 'nationality']
# - grant_claim.tsv ['uuid', 'patent_id', 'text', 'dependent', 'sequence']
# - grant_foreigncitation.tsv ['uuid', 'patent_id', 'date', 'kind', 'number', 'country', 'category', 'sequence']
# - grant_inventor.tsv ['id', 'name_first', 'name_last', 'nationality']
# - grant_lawyer.tsv ['id', 'name_first', 'name_last', 'organization', 'country']
# - grant_location.tsv ['id', 'city', 'state', 'country', 'latitude', 'longitude']
# - grant_otherreference.tsv ['uuid', 'patent_id', 'text', 'sequence']
# - grant_patent.tsv ['id', 'type', 'number', 'country', 'date', 'abstract', 'title', 'kind', 'num_claims']
# - grant_rawassignee.tsv ['uuid', 'patent_id', 'assignee_id', 'rawlocation_id', 'type', 'name_first', 'name_last', 'organization', 'residence', 'nationality', 'sequence']
# - grant_rawinventor ['uuid', 'patent_id', 'inventor_id', 'rawlocation_id', 'name_first', 'name_last', 'sequence']
# - grant_rawlawyer.tsv ['uuid', 'lawyer_id', 'patent_id', 'name_first', 'name_last', 'organization', 'country', 'sequence']
# - grant_rawlocation.tsv ['id', 'location_id', 'city', 'state', 'country']
# - grant_usapplicationcitation.tsv ['uuid', 'patent_id', 'application_id', 'date', 'name', 'kind', 'number', 'country', 'category', 'sequence']
# - grant_uspatentcitation.tsv ['uuid', 'patent_id', 'citation_id', 'date', 'name', 'kind', 'number', 'country', 'category', 'sequence']
# - grant_uspc.tsv ['uuid', 'patent_id', 'mainclass_id', 'subclass_id', 'sequence']
# 
# ## 수정본 구조
# 
# - grant_patent : 위와 동일
# 
# 
# - 다른 파일의 경우: 'patent_id', '...._0', '..._0', ... ,'..._1','..._1','..._2','..._2'...
# 
# - grant_rawassignee_sorted_reduced.csv
# - grant_foreigncitation_sorted.csv
# - grant_rawinventor_sorted.csv
# - grant_otherreference_sorted.csv
# - grant_uspatentcitation_sorted.csv
# - grant_rawlawyer_sorted.csv
# - grant_uspc_sorted.csv
# - grant_usapplicationcitation_sorted.csv
# 
# 
# ex) laywer가 2명일 경우
# 
# grant_laywer: 'patent_id', 'id_0','name_first_0', 'name_last_0', 'organization_0', 'country_0', 'id_1','name_first_1', 'name_last_1', 'organization_1', 'country_1'

# In[15]:


import csv

# EX) 만약 grant_assignee의 'organization','name_first' 들만 뽑고 싶은 경우
right_pointer = open('grant_rawassignee_sorted_reduced.csv', 'r')
right_data = csv.reader(right_pointer)

column = next(right_data)
indexes = [i for i,x in enumerate(column) if 'organization' in x or 'name_first' in x]

column_name = list(column[i] for i in indexes)

print indexes
print column_name

with open('grant_rawassignee_extracted.csv', "wb") as csvfile:
    output = csv.writer(csvfile)
    output.writerow(column_name)
    
    for row in right_data:        
        output.writerow(list(row[i] for i in indexes if len(row) > i))
    
    print "Done"


# In[20]:

# Grant_Patent 옆에 방금 뽑은 column을 붙이고 싶은 경우
left_pointer = open('/Users/jonghkim/Desktop/Research/patent_data/Patent New/grant_patent.tsv', 'r')
left_data = csv.reader(left_pointer, dialect="excel-tab")

right_pointer = open('grant_rawassignee_extracted.csv')
right_data = csv.reader(right_pointer)

with open('grant_patent_rawassignee_merged.csv', "wb") as csvfile:
    output = csv.writer(csvfile)
    for left_row in left_data:
        new_row = left_row + next(right_data)
        output.writerow(new_row)

