SHOW databases;
USE bm_exercise;

# Q1
SELECT name, gender, age, VIP from customer;

# Q2
SELECT ProductName, IssueDate, Brand, Unitprice from prod; # 그냥 호출 
SELECT ProductName, IssueDate, Brand, Unitprice from prod  
	ORDER BY Unitprice DESC;  						# DESC order(내림차순) 조지기

# Q3
SELECT ProductName, IssueDate, Brand, Unitprice from prod  
	WHERE Brand='Polo' or Brand='Prada' 			 #condition 설정
	ORDER BY Unitprice DESC; 	   					 # DESC order(내림차순) 조지기

# Q4
SELECT * FROM purchase
JOIN prod 								# pruchase 오른쪽에 prod를 붙일거야
ON prod.prodID=purchase.prodID;			# prod의 pordID와 purchase의 productID가 같도록

SELECT Unitprice, Brand, CustomerID, totalpurchaseprice  	# 요 순서대로 table 만들 꺼 
FROM purchase JOIN prod							# pruchase와 prod를 합칠거야
ON prod.prodID=purchase.prodID;	

SELECT Unitprice, Brand, CustomerID, totalpurchaseprice
FROM purchase, prod
WHERE prod.prodID=purchase.prodID;				# JOIN ~ ON ~ 대신에 FROM ~ WHERE ~도 가능

SELECT Purchase.*, Customer.*, Prod.*
FROM Customer, Purchase, Prod 						# 3중결합 도전
WHERE Customer.CustomerID = Purchase.CustomerID		# customer와 purchase를 합치고
and Prod.ProdID = Purchase.ProdID;					# prod와 purchase를 합치자

# Q5
SELECT CustomerID, OrderQuantity, Unitprice, 
	Unitprice*OrderQuantity as totalpurchaseprice	# 가격*수량해서 토탈 ㄱㄱ
FROM prod, purchase
WHERE prod.prodID=purchase.prodID

# Q6
SELECT PaymentMethod, count(PaymentMethod) as Freq	# paymthd, count로 table 만듦, count column 이름 = Freq
FROM purchase
GROUP BY PaymentMethod;						# paymethod로 묶으셈

# Q7
SELECT DeliveryMethod, count(DeliveryMethod) as Freq	# dlvrmthd, count로 table 만듦, count column 이름 = Freq
FROM purchase
GROUP BY DeliveryMethod;	

# Q8
SELECT DeliveryMethod, PaymentMethod, count(*) as Freq
FROM purchase
GROUP BY DeliveryMethod, PaymentMethod
ORDER BY DeliveryMethod, PaymentMethod;

# Q9
SELECT CustomerID, DeliveryMethod, PaymentMethod, count(*) as Freq
FROM purchase
GROUP BY CustomerID,DeliveryMethod, PaymentMethod
ORDER BY CustomerID,DeliveryMethod, PaymentMethod;

# Q10
SELECT CustomerID, OrderQuantity, DeliveryMethod, PaymentMethod, 
	Unitprice*OrderQuantity as totalpurchaseprice
FROM purchase, prod
WHERE prod.prodID=purchase.prodID
ORDER BY CustomerID;




