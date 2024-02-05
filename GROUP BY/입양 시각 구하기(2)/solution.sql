SELECT table_form.HOUR, nvl(table_data.COUNT, 0) as COUNT
FROM 
     (SELECT TO_CHAR(datetime, 'HH24') as HOUR, count(ANIMAL_ID) as COUNT
      FROM ANIMAL_OUTS 
      GROUP BY  TO_CHAR(datetime, 'HH24')) table_data
      right JOIN 
      (SELECT LEVEL-1 as HOUR, 0 as COUNT
      FROM DUAL
      CONNECT BY LEVEL <= 24) table_form
      ON table_data.HOUR = table_form.HOUR
ORDER BY table_form.HOUR
