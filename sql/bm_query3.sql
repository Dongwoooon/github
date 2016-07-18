# Q21
SELECT Gender, SUM(Unitprice*OrderQuantity) as totalpurchaseprice,
	count(*) as Freq, ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice	#ROUND로 반올림
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
GROUP BY Gender;

# Q22
SELECT Address, Gender, SUM(Unitprice*OrderQuantity) as totalpurchaseprice,
	count(*) as Freq, ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
GROUP BY Address, Gender;

# Q23
SELECT FLOOR(age/10) as Agegroup, Gender, SUM(Unitprice*OrderQuantity) as 		#FLOOR로 소수점 버림
	totalpurchaseprice,	count(*) as Freq, ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
GROUP BY Agegroup, Gender;

# Q24
SELECT Brand, Gender, SUM(Unitprice*OrderQuantity) as totalpurchaseprice,
	count(*) as Freq, ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
GROUP BY Brand, Gender;

# Q25
SELECT Brand, Gender, count(*) as Freq, 
	ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
GROUP BY Brand, Gender
HAVING Avgpurchaseprice>1000000;

# Q26
SELECT Brand, Gender, count(*) as Freq, 
	ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
	and PaymentMethod='cash'
GROUP BY Brand, Gender
HAVING Avgpurchaseprice>1000000;

# Q27
SELECT Brand, Gender, count(*) as Freq, 
	ROUND(AVG(Unitprice*OrderQuantity),0) as Avgpurchaseprice
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
	and PaymentMethod='cash' and Address='Seoul'
GROUP BY Brand, Gender
HAVING Avgpurchaseprice>1000000;

# Q28
SELECT Brand, count(*) as Freq
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
	and Address!='Seoul'
GROUP BY Brand;

# Q29
SELECT Brand, count(*) as Freq
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
	and Gender='F' and Address!='Seoul'
GROUP BY Brand;

# Q30
SELECT c.Brand
FROM
(
	SELECT Brand, count(*) as Freq
	FROM prod, purchase, customer
	WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
		and Gender='F'
	GROUP BY Brand
) as c
ORDER BY c.Freq DESC LIMIT 1;

# Q31
SELECT DISTINCT purchase.CustomerID, Name
FROM prod, purchase, customer
WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
and Gender='M' and Brand in 
(	
	SELECT Brand
	FROM prod, purchase, customer
	WHERE prod.prodID=purchase.prodID and purchase.CustomerID=customer.CustomerID
		and Gender='F'
	GROUP BY Brand
	ORDER BY count(*) DESC
);
