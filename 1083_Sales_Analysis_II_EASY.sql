--IPHONE BUYERS
WITH CTE_IPHONE_BUYERS as
(SELECT BUYER_ID
 FROM SALES
 WHERE PRODUCT_ID IN (SELECT PRODUCT_ID FROM PRODUCT WHERE PRODUCT_NAME = 'iPhone'))
 select DISTINCT buyer_id
 from sales
 -- bought an s8
 where product_id in (select product_id from product where product_name = 'S8')
 -- but not an iphone buyer
 and buyer_id not in (select buyer_id from CTE_IPHONE_BUYERS)
