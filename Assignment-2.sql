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



--
--select Adv_Type,Action1,COUNT(*) count_Actions ,count(Action1)
--from ECommerce
--group by Adv_Type,Action1


--select Adv_Type,COUNT(*) count_Actions 
--from ECommerce
--group by Adv_Type

SELECT Adv_Type, 
       COUNT(*) sum_adv,
       SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END) count_action,
	   (1.0)/(COUNT(*) / SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END  )) ratio
FROM ECommerce
GROUP BY Adv_Type


SELECT Adv_Type, 
       --COUNT(*) sum_adv,
       -- SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END) count_action,
	   (1.0)/(COUNT(*) / SUM(CASE WHEN Action1 = 'Review' THEN 1 ELSE 0 END  )) ratio
FROM ECommerce
GROUP BY Adv_Type


USE SampleRetail;


select sc.customer_id,sc.first_name,sc.last_name,pp.product_name, 
(CASE WHEN pp.product_name = 'Polk Audio - 50 W Woofer - Black' THEN 'Yes' ELSE 'No' END) Other_Product
from sale.customer sc ,sale.orders so, sale.order_item soi , product.product pp
where sc.customer_id = so.customer_id
			and so.order_id= soi.order_id
			and soi.product_id = pp.product_id
			and pp.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD'

order by 1