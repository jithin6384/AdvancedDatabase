-- Update the first customer
UPDATE users
SET email = 'tom1@example.com', name = "Jerry"
WHERE id = 1;

Select * from users where user_id = 1;

-- Update the first product
UPDATE accommodations
SET price = 1000
WHERE id = 5;


-- Delete the product with product_id = 1
DELETE FROM accommodations
WHERE id = 7;
