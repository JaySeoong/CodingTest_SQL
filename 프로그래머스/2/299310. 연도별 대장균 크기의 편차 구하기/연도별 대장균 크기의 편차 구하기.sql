SELECT YEAR(DIFFERENTIATION_DATE) AS YEAR, MAX_SIZE-SIZE_OF_COLONY AS YEAR_DEV, ID
FROM ECOLI_DATA AS O1
INNER JOIN (SELECT YEAR(DIFFERENTIATION_DATE) AS Y, MAX(SIZE_OF_COLONY) AS MAX_SIZE
            FROM ECOLI_DATA
            GROUP BY YEAR(DIFFERENTIATION_DATE)) AS S1
ON YEAR(O1.DIFFERENTIATION_DATE) = S1.Y
ORDER BY YEAR ASC, YEAR_DEV ASC;