from sqlalchemy import *		#sqlalchemy 부르기
from datetime import datetime

### 작업할 metadata object 생성 + engine에 binding
metadata = MetaData('sqlite:///tutorial.sqlite')	#tutorial이라는 sqlite DB새로 만듦
metadata.bind.echo=True								#echo=Ture시 query의 log 볼 수 있음

user_table = Table(
	'tf_user', metadata,							#table 이름, metadata type 설정
	Column('id', Integer, primary_key=True),		#id를 primary key로
	Column('user_name', Unicode(16), unique=True, nullable=False),	#이름은 중복, null 불가
	Column('password', Unicode(40), nullable=False),
	Column('display_name', Unicode(255), default=''),	#default 지정
	Column('created', DateTime, default=datetime.now)
	)

group_table = Table(
	'tf_group', metadata,
	Column('id', Integer, primary_key=True),
	Column('group_name', Unicode(16), unique=True, nullable=False)
	)

permission_table = Table(
	'tf_permission', metadata,
	Column('id', Integer, primary_key=True),
	Column('permission_name', Unicode(16), unique=True, nullable=False)
	)

user_group_table = Table(					#join table 만들어보자
	'tf_user_group', metadata,
	Column('user_id', None, ForeignKey('tf_user.id'), primary_key=True),
	Column('group_id', None, ForeignKey('tf_group.id'), primary_key=True)
	)
''' compound primary keys(1개 이상의 primary key column 존재), 
	foreign key constraints 적용
	foreign key column의 datatype=None으로 설정 :
	이렇게 하면 column of related table(여기선 tf_user.id or tf_group.id)의 
	datatype에 알아서 맞춰줌 '''

group_permission_table = Table(
	'tf_group_permission', metadata,
	Column('permission_id', None, ForeignKey('tf_permission.id'), primary_key=True),
	Column('group_id', None, ForeignKey('tf_group.id'),	primary_key=True)
	)

metadata.create_all() #지금껏 만든 metadata(talbe)을 DB에 생성


### Query 보내기
'''table 5개짜리 DB 만들었으니까 이 DB에 query들을 날리면서 갖고 놀아보자'''

stmt = user_table.insert() 		#만든 DB table에 data를 집어넣을거임
stmt.execute(user_name='rick', password='secret', display_name
	='Rick Copeland') 			#created column에는 입력 안 해주면 default값 들어감
stmt.execute(user_name='rick1', password='secret', display_name
	='Rick Copeland Clone')

stmt = user_table.select()		#data select
result = stmt.execute()
for row in result:
	print (row)					#table에 있는 row 전부 출력

stmt = user_table.select(user_table.c.user_name=='rick')	#condition맞게 select(where 역할), table.c. : c가 column을 의미
print (stmt.execute().fetchall())		#fetchall : row 전부 다 뽑기

# Create an update constrained by user name
stmt = user_table.update(user_table.c.user_name=='rick')
# Execute the update, setting the password column to secret123
stmt.execute(password='secret123')
<sqlalchemy.engine.base.ResultProxy object at 0xa20c50>
# Create a delete statement that deletes all users
# except for 'rick'
stmt = user_table.delete(user_table.c.user_name != 'rick')
stmt.execute()
<sqlalchemy.engine.base.ResultProxy object at 0x2b12bf430210>
# Select the users back from the database
user_table.select().execute().fetchall()
[(1, u'rick', u'secret123', u'Rick Copeland', datetime.datetime(2007, 9, 7, 18, 35, 35, 529412))]
# Add the users back
stmt = user_table.insert()
stmt.execute(user_name='rick1', password='secret', display_name='Rick Copeland Clone')
<sqlalchemy.engine.base.ResultProxy object at 0xa20c90>
stmt.execute(user_name='rick2', password='secret', display_name='Rick Copeland Clone 2')
<sqlalchemy.engine.base.ResultProxy object at 0xa20cd0>