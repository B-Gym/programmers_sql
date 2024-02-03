-- 코드를 입력하세요
SELECT FLAVOR
FROM FIRST_HALF half
WHERE TOTAL_ORDER > 3000 
AND half.FLAVOR IN 
                (SELECT DISTINCT info.FLAVOR 
                 FROM ICECREAM_INFO info 
                 WHERE info.INGREDIENT_TYPE = 'fruit_based')
ORDER BY TOTAL_ORDER desc