-- GROUP BY해서 CNT얻고 CNT중에 MAX값과 ID값 가져와서 T1,T2 JOIN해서 컬럼3개 SELECT
-- CNT얻은 테이블에 MAX(CNT)값을 가진 ID를 가져오는 과정 -> 한번에 얻는 방법이 없나?
-- PARTITION BY 사용법 제대로 알기. CNT.MAX값 가져오는거 LIMIT 1, MAX말고는 없나?
-- LIMIT 1이 성능은 더 좋아보이는데 정석방법이 맞나?

SELECT M1.MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, "%Y-%m-%d") AS REVIEW_DATE
FROM 
(SELECT MEMBER_ID, REVIEW_TEXT, REVIEW_DATE, COUNT(*) OVER (PARTITION BY MEMBER_ID) AS CNT
FROM REST_REVIEW) T2
INNER JOIN MEMBER_PROFILE M1 ON T2.MEMBER_ID = M1.MEMBER_ID
WHERE CNT = 
(SELECT MAX(T1.CNT)
FROM
(SELECT MEMBER_ID, COUNT(*) AS CNT
FROM REST_REVIEW
GROUP BY MEMBER_ID) T1)
ORDER BY REVIEW_DATE ASC, REVIEW_TEXT ASC ;