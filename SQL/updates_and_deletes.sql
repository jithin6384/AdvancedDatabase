-- Update the first customer
UPDATE users
SET email = 'tom1@example.com', name = "Jerry"
WHERE id = 1;

Select * from users where user_id = 1;

-- Update the first product
UPDATE accommodations
SET price = 1000
WHERE id = 5;


UPDATE verification_requests
SET status = 'VERIFIED'
WHERE id IN (
 
    SELECT id FROM verification_requests ORDER BY id ASC LIMIT 4
  
);

--updating the dynamically column by a individual seller 




  
  
  
DELIMITER $$

CREATE PROCEDURE create_accommodation_for_seller(IN sellerID INT)
BEGIN
    UPDATE verification_requests
    SET status = 'VERIFIED'
    WHERE seller_id = sellerID;
END$$

DELIMITER ;

-- fetching the seller id
SELECT id INTO @seller_id
FROM users
WHERE role = 'SELLER'
  AND email = 'mark@exampe.com';

CALL create_accommodation_for_seller(@seller_id);



-- Delete the product with product_id = 1
DELETE FROM accommodations
WHERE id = 7;



