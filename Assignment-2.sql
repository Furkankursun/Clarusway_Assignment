USE ass2;


CREATE TABLE ECommerce (
	Visitor_ID INT IDENTITY (1, 1) PRIMARY KEY,
	Adv_Type VARCHAR (255) NOT NULL,
	Action1 VARCHAR (255) NOT NULL
);


INSERT INTO ECommerce (Adv_Type, Action1)
VALUES 
('A', 'Left'),
('A', 'Order'),
('B', 'Left'),
('A', 'Order'),
('A', 'Review'),
('A', 'Left'),
('B', 'Left'),
('B', 'Order'),
('B', 'Review'),
('A', 'Review');



---- 2. Conversion Rate

USE ass2;

SELECT Adv_Type, 
       COUNT(*) sum_adv,
       SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END) count_action,
	   (1.0)/(COUNT(*) / SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END )) ratio
FROM ECommerce
GROUP BY Adv_Type


SELECT Adv_Type, 
       --COUNT(*) sum_adv,
       -- SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END) count_action,
	   (1.0)/(COUNT(*) / SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END  )) ratio
FROM ECommerce
GROUP BY Adv_Type

---1. Product Sales

USE SampleRetail;

select  distinct  sc.customer_id ,sc.first_name, sc.last_name,CASE WHEN so.order_id=any(SELECT order_id FROM sale.order_item WHERE product_id = 13)
								THEN 'Yes' ELSE 'No' END Other_Product
from sale.order_item soi ,product.product pp,sale.customer sc ,sale.orders so
where soi.product_id = pp.product_id and sc.customer_id = so.customer_id and so.order_id= soi.order_id
														and	soi.order_id = any (select order_id
															from sale.order_item
															where product_id = 6)

order by  1


select * from
product.product
WHERE product_id in (13,6) 

