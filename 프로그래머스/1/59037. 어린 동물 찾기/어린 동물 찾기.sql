-- NOT 함수 유념
SELECT animal_id, name
FROM animal_ins
WHERE NOT intake_condition = 'aged'
ORDER BY animal_id;