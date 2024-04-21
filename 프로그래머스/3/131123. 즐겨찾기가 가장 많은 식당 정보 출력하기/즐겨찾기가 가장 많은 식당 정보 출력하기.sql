-- 집계함수를 꼭 SELECT에서 안 쓰고 HAVING에서만 사용 가능 WHERE IN 쓸땐 하나의 컬럼 범위 안에서만 쓸 것
-- 집계함수를 사용한 컬럼명과 사용하지 않은 컬럼을 같이 조회하면 엉뚱한 데이터를 얻게 됨에 주의
-- JOIN의 ON에 조건 여러개 가능
SELECT R1.FOOD_TYPE, R1.REST_ID, R1.REST_NAME, R1.FAVORITES
FROM REST_INFO AS R1
INNER JOIN
(SELECT FOOD_TYPE, MAX(FAVORITES) AS FAVORITES
FROM REST_INFO
GROUP BY FOOD_TYPE
HAVING FAVORITES) R2
ON R1.FOOD_TYPE = R2.FOOD_TYPE AND R1.FAVORITES = R2.FAVORITES
ORDER BY FOOD_TYPE DESC  ;