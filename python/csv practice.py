
import csv

right_pointer = open('C:/Users/Dongwoon/Desktop/universityData.csv', 'r')
right_data = csv.reader(right_pointer, delimiter='\t', quotechar=' ')

column = next(right_data)

for i,x in enumerate(column):
	print (i,x) 

indexes = [i for i,x in enumerate(column)]
print (indexes)

column_name = list(column[i] for i in indexes)
print(column_name)

'''with open('grant_rawassignee_extracted.csv', "wb") as csvfile:
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
        output.writerow(new_row)'''

