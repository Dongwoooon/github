# Q11
SELECT DeliveryMethod, SUM(Unitprice*OrderQuantity) as totalpurchaseprice,
	count(*) as Freq
FROM prod, purchase
WHERE prod.prodID=purchase.prodID
GROUP BY DeliveryMethod;

# Q12
SELECT PaymentMethod, SUM(Unitprice*OrderQuantity) as totalpurchaseprice,
	count(*) as Freq, AVG(Unitprice*OrderQuantity) as AvgPurchasePrice
FROM prod, purchase
WHERE prod.prodID=purchase.prodID
GROUP BY PaymentMethod;

# Q13
SELECT PaymentMethod, MAX(Unitprice*OrderQuantity) as Max_Rev, 
	MIN(Unitprice*OrderQuantity) as Min_Rev
FROM prod, purchase
WHERE prod.prodID=purchase.prodID
GROUP BY PaymentMethod;

# Q14
SELECT customer.CustomerID, Name, count(*) as Num_prchs 	
FROM customer, purchase
WHERE customer.customerID=purchase.customerID
GROUP BY Name
ORDER BY CustomerID;

# Q15
SELECT Gender, PaymentMethod, count(*) as Num_prchs 	
FROM customer, purchase
WHERE customer.customerID=purchase.customerID
GROUP BY Gender, PaymentMethod;

# Q16
SELECT MAX(a.num) as Max_Num_Purchases, MIN(a.num) as Max_Num_Purchases
FROM
(
	SELECT customerID, count(*) as num 
	FROM purchase
	GROUP BY customerID
) as a; 

# Q17, 18
SELECT a.ID, a.Name
FROM
(
	SELECT p.customerID as ID, Name, count(*) as num 
	FROM purchase p, customer c
	WHERE p.customerID=c.CustomerID
	GROUP BY 1
) as a
ORDER BY num desc LIMIT 1;			# desc 대신 asc 쓰면 Q18

WITH counting as
(
	SELECT p.customerID as ID, Name, count(*) as num 
	FROM purchase p, customer c
	WHERE p.customerID=c.CustomerID
	GROUP BY 1
),
select * from counting;

# Q19
SELECT a.ID, a.Name
FROM
(
	SELECT p.customerID as ID, Name, count(*) as num 
	FROM purchase p, customer c
	WHERE p.customerID=c.CustomerID and gender='F'
	GROUP BY 1
) as a
ORDER BY num asc LIMIT 1;
