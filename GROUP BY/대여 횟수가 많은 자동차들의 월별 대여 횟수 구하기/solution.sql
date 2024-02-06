    SELECT TO_CHAR(START_DATE, 'MM') as MONTH, a.CAR_ID, count(a.CAR_ID) as RECORDS
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY a
    inner join
    (
            SELECT CAR_ID
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
            WHERE TO_CHAR(START_DATE, 'YYYY-MM') between '2022-08' and '2022-10'
            HAVING count(CAR_ID) >= 5
            GROUP BY CAR_ID
    ) b
    ON a.CAR_ID = b.CAR_ID
    WHERE TO_CHAR(START_DATE, 'YYYY-MM') between '2022-08' and '2022-10'
    GROUP BY TO_CHAR(START_DATE, 'MM'), a.CAR_ID