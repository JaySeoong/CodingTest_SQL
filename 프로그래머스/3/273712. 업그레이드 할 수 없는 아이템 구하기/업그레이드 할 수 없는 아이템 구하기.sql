SELECT ITEM_ID, ITEM_NAME, RARITY
FROM ITEM_INFO 
WHERE ITEM_ID NOT IN(
    SELECT PARENT_ITEM_ID
    FROM ITEM_TREE
    WHERE PARENT_ITEM_ID IS NOT NULL
    -- 위, WHERE 조건 없으면 빈 집합을 반환하게 됨 -> 비교를 못함.
    -- NOT IN 혹은 IN 내부에 NULL이 있으면 동작에 문제가 있을 수 있어, NULL 제거가 반드시 선행되어야 함.
    -- NOT IN은 전체를 비교하므로 NULL 반드시 제거, IN의 경우에 선일치하는 값이 있을 수 있어 일부 동작.
    )
ORDER BY ITEM_ID DESC;
