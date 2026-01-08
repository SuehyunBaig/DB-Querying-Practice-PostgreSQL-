SELECT a.id
FROM weather a LEFT JOIN weather b ON a.recorddate = b.recorddate + 1
WHERE a.temperature > b.temperature;
