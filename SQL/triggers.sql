-- creating triggers for creating verification request so that whenever  accomodtion is created trigger runs to create a verification request


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


-- creating triggers for creating verification request
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

