-- 코드를 입력하세요
SELECT MEMBER_NAME, REVIEW_TEXT, TO_CHAR(REVIEW_DATE, 'YYYY-MM-DD') as REVIEW_DATE
FROM REST_REVIEW "식당 리뷰"
inner join
(
    SELECT "고객".MEMBER_ID, MEMBER_NAME
    FROM
    MEMBER_PROFILE "고객" 
    inner join
    (
        SELECT 
        MEMBER_ID
        , rank() over(ORDER BY count(MEMBER_ID) desc) as RANK
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
    ) "상위 리뷰수 고객"
    ON "고객".MEMBER_ID = "상위 리뷰수 고객".MEMBER_ID
    WHERE RANK = 1
) "상위 리뷰수 고객 정보"
ON "식당 리뷰".MEMBER_ID = "상위 리뷰수 고객 정보".MEMBER_ID
ORDER BY REVIEW_DATE, REVIEW_TEXT