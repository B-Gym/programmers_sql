SELECT MCDP_CD as 진료과코드, count(distinct PT_NO) as "5월예약건수"
FROM APPOINTMENT
WHERE TO_CHAR(APNT_YMD, 'YYYY-MM') like '2022-05'
-- AND APNT_CNCL_YMD is null
GROUP BY MCDP_CD
ORDER BY count(distinct PT_NO), MCDP_CD

-- 오라클에서 AS 별칭(Alias)를 숫자를 포함하여 주고싶다면 ""(쌍따옴표)를 이용하면 된다.