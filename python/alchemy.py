from sqlalchemy import create_engine 		#engine 생성
engine=create_engine('mysql://root:0000@localhost/bm_exercise', echo=True)

from sqlalchemy.ext.declarative import declarative_base 	#base class 생성
Base = declarative_base()

from sqlalchemy.orm import sessionmaker		#Session class 생성
Session = sessionmaker(bind=engine)

db_session = Session()		#Session instance 생성

from sqlalchemy import Column, Integer, Unicode, String 	#상속 class 생성
class Store(Base):		
    __tablename__ = 'stores'

    id = Column(Integer, primary_key=True)
    name = Column(Unicode(50), nullable=False)
    phone = Column(String(20))
    def __init__(self, name, phone):
    	self.name=name
    	self.phone=phone
    def __repr__(self):
    	return "store('%s','%s')"%(self.name, self.phone)

Store.__table__ 		#metadata 보기
Store.__mapper__

store1 = Store('GS25','1243') 	#instance 만들기

Base.metadata.create_all(engine)
