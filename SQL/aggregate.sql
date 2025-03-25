-- Query to find the most occupied accommodations
SELECT accommodation_id, COUNT(*) AS rental_count
FROM rental_transactions
GROUP BY accommodation_id
ORDER BY rental_count DESC
LIMIT 1;

-- Procedure: to count how many students have occupied one accommodation
DELIMITER $$

CREATE PROCEDURE get_user_count_for_accommodation(IN acc_id INT)
BEGIN
    SELECT 
        a.id AS accommodation_id,
        a.title,
        COUNT(rt.student_id) AS total_users
    FROM accommodations a
    LEFT JOIN rental_transactions rt ON a.id = rt.accommodation_id
    WHERE a.id = acc_id
    GROUP BY a.id, a.title;
END$$

DELIMITER ;


-- Call the procedure 

CALL get_user_count_for_accommodation(3);


-- Most expensive accommodations

SELECT id, title, price
FROM accommodations
ORDER BY price DESC
LIMIT 1;


