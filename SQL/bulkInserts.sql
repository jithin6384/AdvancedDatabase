-- creating sample data for users
INSERT INTO users (name, email, password, role)
VALUES 
('Tom Riddle', 'tom@example.com', 'password', 'STUDENT'),
('Mark Riddle', 'mark@exampe.com', 'password', 'SELLER'),
('Tom Hardy', 'hardy@exampe.com', 'password', 'ADMIN'),
('Tom HiddlesStone', 'hiddleston@exampe.com', 'password', 'STUDENT'),
('Tom Holland', 'olland@exampe.com', 'password', 'SELLER'),
('Chris Evans', 'chrisEvans@exampe.com', 'password', 'Student'),
('Chris Hemsworth', 'chrisHems@exampe.com', 'password', 'Student'),
('Chris pratt', 'chrispratt@exampe.com', 'password', 'SELLER'),
('Robert Downey', 'rdj@exampe.com', 'password', 'SELLER'),
('Rocket Raccon', 'rocket@exampe.com', 'password', 'Student');


-- creating sample data for accomodations
--- creating accomodations will also create verification request

INSERT INTO accommodations (title, description, price, seller_id)
VALUES 
('Quiet Apartment', 'Peaceful, 2bhk.', 750.00, 2),
('2BHk Apartment', 'WonderFul, 2bhk.', 500.00, 5),
('3BHk Apartment', 'WonderFul, 3bhk.', 500.00, 8),
('5BHk Apartment', 'WonderFul, Accomodation for 5 people.', 800.00, 9),
('6 BHk Apartment', 'WonderFul, Accomodation for 5 people.', 800.00, 5),
('5 BHk Apartments ', 'WonderFul, Accomodation for 5 people.', 800.00, 8),
('Big house', 'WonderFul, Accomodation for 5 people.', 800.00, 9),
('House for rent', 'WonderFul, Accomodation for 5 people.', 800.00, 2),
('5 room rents availbles', 'WonderFul, Accomodation for 5 people.', 800.00, 2),
('5 room flat  ', ' Accomodation for  people.', 800.00, 8);


--- creating triggers for creating verification request


DELIMITER //
CREATE TRIGGER createAccommodations
AFTER INSERT ON accommodations
FOR EACH ROW
BEGIN
    INSERT INTO verification_requests (accommodation_id, seller_id, status)
    VALUES (NEW.id, NEW.seller_id, 'PENDING');
END;
//
DELIMITER ;

--- creating rental transactions with transactions 

START TRANSACTION;

INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (1, 1);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (2, 4);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (3, 6);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (4, 7);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (5, 10);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (6, 6);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (7, 4);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (8, 1);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (9, 7);
INSERT INTO rental_transactions (accommodation_id, student_id) VALUES (10, 10);

COMMIT;


--- creating triggers for creating verification request


DELIMITER //

CREATE TRIGGER trg_mark_accommodation_rented
AFTER INSERT ON rental_transactions
FOR EACH ROW
BEGIN
  UPDATE accommodations
  SET status = 'RENTED'
  WHERE id = NEW.accommodation_id;
END;
//

DELIMITER ;





