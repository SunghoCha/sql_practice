-- MAX함수를 PRICE에만 적용하고 SELECT하면 다른 속성들은 MAX PRICE를 가진 ROW가 아닌
-- 다른 ROW의 값들(첫번째)을 가져와버림
SELECT PRODUCT_ID, PRODUCT_NAME, PRODUCT_CD, CATEGORY, PRICE
FROM FOOD_PRODUCT
WHERE PRICE = (SELECT MAX(PRICE) FROM FOOD_PRODUCT) ;