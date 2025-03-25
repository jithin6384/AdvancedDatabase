-- Table: users
-- Purpose: user details (SELLER, ADMIN, STUDENT).
CREATE TABLE users (
  id  INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role VARCHAR(20) CHECK (role IN ('SELLER', 'ADMIN', 'STUDENT')) NOT NULL
);

-- Table: accommodations
-- Purpose:  accommodation posts created by sellers.
CREATE TABLE accommodations (
  id  INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  verified BOOLEAN DEFAULT FALSE,
  status VARCHAR(20) CHECK (status IN ('AVAILABLE', 'RENTED')) DEFAULT 'AVAILABLE',
  seller_id INT NOT NULL,
  FOREIGN KEY (seller_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: verification_requests
-- Purpose: Once the user creates a accomodation the verification requests keep track of the accomodations verfied by users.
CREATE TABLE verification_requests (
  id  INT AUTO_INCREMENT PRIMARY KEY,
  accommodation_id INT NOT NULL,
  seller_id INT NOT NULL,
  status VARCHAR(20) CHECK (status IN ('PENDING', 'VERIFIED', 'REJECTED')) DEFAULT 'PENDING',
  FOREIGN KEY (accommodation_id) REFERENCES accommodations(id) ON DELETE CASCADE,
  FOREIGN KEY (seller_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: rental_transactions(Many to Many between users and Accomodations
-- Purpose: Tracks the accomodations that are rented by students .
CREATE TABLE rental_transactions (
  id  INT AUTO_INCREMENT PRIMARY KEY,
  accommodation_id INT NOT NULL,
  student_id INT NOT NULL,
  rented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (accommodation_id) REFERENCES accommodations(id) ON DELETE CASCADE,
  FOREIGN KEY (student_id) REFERENCES users(id) ON DELETE CASCADE
);

