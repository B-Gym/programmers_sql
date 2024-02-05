-- 코드를 입력하세요
SELECT PRICE_GROUP, count(PRODUCT_ID) as PRODUCTS
FROM (SELECT PRODUCT_ID,
             case when PRICE < 10000 then 0
             else floor(PRICE/10000)*10000
             end as PRICE_GROUP
      FROM PRODUCT) 
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP
