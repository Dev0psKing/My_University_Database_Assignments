-- Create the Books table if it does not exist
-- The Books table stores information about books in the library
CREATE TABLE IF NOT EXISTS Books (
                                     ISBN VARCHAR(13) PRIMARY KEY,         -- Unique identifier for each book
    Title VARCHAR(255) NOT NULL,          -- Title of the book
    Author VARCHAR(255) NOT NULL,         -- Author of the book
    Genre VARCHAR(100),                   -- Genre of the book
    Quantity INTEGER NOT NULL             -- Quantity of the book available in the library
    );

-- Create the Members table if it does not exist
-- The Members table stores information about library members
CREATE TABLE IF NOT EXISTS Members (
                                       MemberID INTEGER PRIMARY KEY AUTOINCREMENT, -- Unique identifier for each member, auto-incremented
                                       Name VARCHAR(255) NOT NULL,                 -- Name of the member
    Email VARCHAR(255) UNIQUE NOT NULL,         -- Email address of the member, must be unique
    Phone VARCHAR(20)                           -- Phone number of the member
    );

-- Create the Loans table if it does not exist
-- The Loans table stores information about books borrowed by members
CREATE TABLE IF NOT EXISTS Loans (
                                     LoanID INTEGER PRIMARY KEY AUTOINCREMENT,   -- Unique identifier for each loan, auto-incremented
                                     MemberID INTEGER,                           -- Member ID of the borrower, references Members(MemberID)
                                     ISBN VARCHAR(13),                           -- ISBN of the borrowed book, references Books(ISBN)
    LoanDate DATE NOT NULL,                     -- Date when the book was borrowed
    ReturnDate DATE,                            -- Date when the book was returned
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID), -- Foreign key constraint linking to Members table
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)   -- Foreign key constraint linking to Books table
    );

-- Insert new book records into the Books table
-- These statements add new books to the library inventory
INSERT INTO Books (ISBN, Title, Author, Genre, Quantity)
VALUES
    ('9780743273565', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 3),
    ('9780140449136', 'The Odyssey', 'Homer', 'Epic', 2),
    ('9780451526342', 'Animal Farm', 'George Orwell', 'Political Fiction', 6),
    ('9780307277671', 'The Road', 'Cormac McCarthy', 'Post-Apocalyptic', 4);

-- Insert new member records into the Members table
-- These statements add new members to the library
INSERT INTO Members (Name, Email, Phone)
VALUES
    ('John Doe', 'john.doe@email.com', '123-456-7890'),
    ('Jane Smith', 'jane.smith@email.com', '987-654-3210'),
    ('Alice Johnson', 'alice.johnson@email.com', '456-789-1230'),
    ('Bob Brown', 'bob.brown@email.com', '789-123-4560'),
    ('Carol White', 'carol.white@email.com', '321-654-9870'),
    ('David Black', 'david.black@email.com', '654-987-3210');

-- Insert new loan records into the Loans table
-- These statements record the borrowing of books by members
INSERT INTO Loans (MemberID, ISBN, LoanDate, ReturnDate)
VALUES
    (1, '9780743273565', '2024-07-14', NULL),
    (2, '9780140449136', '2024-07-13', '2024-07-27'),
    (3, '9780451526342', '2024-07-15', NULL),
    (4, '9780307277671', '2024-07-16', NULL);

-- Retrieve all information about books borrowed by a specific member (e.g., MemberID = 1)
-- This query joins the Books and Loans tables to get detailed information about borrowed books
SELECT b.ISBN, b.Title, b.Author, b.Genre, b.Quantity, l.LoanDate, l.ReturnDate
FROM Books b
         JOIN Loans l ON b.ISBN = l.ISBN
WHERE l.MemberID = 1;

-- Update the quantity of a particular book in the Books table
-- This statement updates the quantity of a book identified by its ISBN
UPDATE Books
SET Quantity = 5
WHERE ISBN = '9780743273565';

-- Delete a member record from the Members table
-- This statement deletes a member identified by their MemberID
DELETE FROM Members
WHERE MemberID = 2;

-- Verify the deletion by checking the Members table
-- This query checks if the member with MemberID = 2 has been deleted
SELECT * FROM Members WHERE MemberID = 2;
