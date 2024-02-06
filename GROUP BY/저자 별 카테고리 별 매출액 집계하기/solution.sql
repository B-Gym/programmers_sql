SELECT a.AUTHOR_ID, AUTHOR_NAME, CATEGORY, sum(TOTAL_SALES) as TOTAL_SALES
FROM AUTHOR a
INNER JOIN
(
    SELECT SUM(SALES*PRICE) as TOTAL_SALES, CATEGORY, a.BOOK_ID, AUTHOR_ID
    FROM BOOK_SALES a INNER JOIN BOOK b
    ON a.BOOK_ID = b.BOOK_ID
    WHERE TO_CHAR(SALES_DATE, 'YYYY-MM') like '2022-01'
    GROUP BY PRICE, CATEGORY, a.BOOK_ID, AUTHOR_ID
) b 
ON a.AUTHOR_ID = b.AUTHOR_ID
GROUP BY a.AUTHOR_ID, AUTHOR_NAME, CATEGORY
ORDER BY AUTHOR_ID asc, CATEGORY desc

-- SELECT
--        도서정보.AUTHOR_ID                     "저자번호"
--      , 저자정보.AUTHOR_NAME                   "저자명"
--      , 도서정보.CATEGORY                      "카테고리"
--      , SUM(판매량정보.SALES * 도서정보.PRICE)   "SALES"
--   FROM
--        BOOK_SALES   "판매량정보"
--      , BOOK         "도서정보"
--      , AUTHOR       "저자정보"
--  WHERE 1=1
--    AND 판매량정보.BOOK_ID = 도서정보.BOOK_ID(+)
--    AND 도서정보.AUTHOR_ID = 저자정보.AUTHOR_ID(+)
--    AND TO_CHAR(판매량정보.SALES_DATE,'YYYYMM') = 202201
--  GROUP BY 도서정보.AUTHOR_ID
--         , 저자정보.AUTHOR_NAME
--         , 도서정보.CATEGORY
--  ORDER BY 저자번호 ASC, 카테고리 DESC