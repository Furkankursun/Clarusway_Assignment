
-- Assignment 3 
--Discount Effects

--Generate a report including product IDs and discount effects on whether the increase in
--the discount rate positively impacts the number of orders for the products.

--In this assignment, you are expected to generate a solution using SQL with a logical approach. 


--group by
select pp.product_id,pp.product_name,soi.discount,SUM(soi.quantity) sat�lan_mik --,COUNT(*) indirim_�esit
from product.product pp 
left join sale.order_item soi
on pp.product_id = soi.product_id
--where soi.discount =0.05
group by pp.product_id,pp.product_name,soi.discount 



--windows func
select distinct pp.product_id,pp.product_name,soi.discount,
SUM(soi.quantity) OVER (PARTITION BY pp.product_id,soi.discount) TOTAL_QUANTITY,
COUNT(soi.quantity) OVER (PARTITION BY pp.product_id,pp.product_name,soi.discount) indirim_�esit
from product.product pp 
left join sale.order_item soi
on pp.product_id = soi.product_id

--


select t1.product_id,t1.product_name, MIN(t1.discount) discount_rate, MIN(t1.TOTAL_QUANTITY) min_miktar
from
(select distinct pp.product_id,pp.product_name,soi.discount,
SUM(soi.quantity) OVER (PARTITION BY pp.product_id,soi.discount) TOTAL_QUANTITY
from product.product pp 
left join sale.order_item soi
on pp.product_id = soi.product_id) as t1

group by t1.product_id,t1.product_name




select  t1.product_id,t1.product_name, COUNT(*) indirim_�esit  -- distinct OVER (PARTITION BY t1.product_id,t1.product_name) indirim_�esit
from
(select distinct pp.product_id,pp.product_name,soi.discount,
SUM(soi.quantity) OVER (PARTITION BY pp.product_id,soi.discount) TOTAL_QUANTITY
from product.product pp 
left join sale.order_item soi
on pp.product_id = soi.product_id) as t1

group by t1.product_id,t1.product_name

having COUNT(*)>2


---------------
with t1 as (select pp.product_id,pp.product_name,soi.discount,SUM(soi.quantity) sat�lan_mik 
from product.product pp 
left join sale.order_item soi
on pp.product_id = soi.product_id
group by pp.product_id,pp.product_name,soi.discount) 


select distinct A.*, B.discount,B.sat�lan_mik,A.sat�lan_mik- B.sat�lan_mik fark
--,case when end
from t1 A,t1 B
where A.product_id=B.product_id and A.product_name = B.product_name  
and A.discount = 0.05  and  B.discount != 0.05
order by 1

----

 with t1 as (select pp.product_id,pp.product_name,soi.discount,SUM(soi.quantity) sat�lan_mik 
from product.product pp 
left join sale.order_item soi
on pp.product_id = soi.product_id
group by pp.product_id,pp.product_name,soi.discount) 


select distinct A.*, B.discount,B.sat�lan_mik,A.sat�lan_mik- B.sat�lan_mik fark,
case
when A.sat�lan_mik > B.sat�lan_mik  then 'Negative' 
when  A.sat�lan_mik < B.sat�lan_mik  then 'Pozitif' 
when  A.sat�lan_mik = B.sat�lan_mik  then 'Neutral' 
when  (A.sat�lan_mik) = Null then 'No commend' 
end as Discount_Effect
from t1 A,t1 B
where A.product_id=B.product_id and A.product_name = B.product_name  
and A.discount = 0.05  and  B.discount != 0.05
order by 1



















