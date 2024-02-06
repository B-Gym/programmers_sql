SELECT YEAR, TO_NUMBER(MONTH) as MONTH, GENDER, count(distinct a.USER_ID) as USERS
FROM USER_INFO a,
(
    SELECT 
    case when TO_CHAR(SALES_DATE, 'YYYY') like '2%' 
                then  TO_CHAR(SALES_DATE, 'YYYY') 
    end as YEAR
    , case when TO_CHAR(SALES_DATE, 'MM') < '13' 
                then  TO_CHAR(SALES_DATE, 'MM') 
    end as MONTH
    , USER_ID
    FROM ONLINE_SALE
) b
WHERE a.USER_ID = b.USER_ID
HAVING GENDER is not null 
GROUP BY YEAR, MONTH, GENDER
ORDER BY YEAR, MONTH, GENDER