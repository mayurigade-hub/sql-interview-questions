# Write your MySQL query statement below
SELECT 
    s.user_id,
    COALESCE(
        ROUND(SUM(c.action = 'confirmed')/ COUNT(c.action), 2),
        0
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id 
GROUP BY s.user_id;

-- why we are using COALESCE 
-- COALESCE(value, replacement)
-- If value is NOT NULL → use it.
-- If value IS NULL → use replacement.
-- Here in this Question It is for user_id = 6