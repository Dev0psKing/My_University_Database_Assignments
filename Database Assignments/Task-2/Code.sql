-- Books table
CREATE TABLE Books (
                       Book_ID INT PRIMARY KEY,
                       Title VARCHAR(255) NOT NULL,
                       Publication_Year INT,
                       Price DECIMAL(10, 2)
);

-- Author table (allowing multiple authors per book)
CREATE TABLE Author (
                        Book_ID INT,
                        Author VARCHAR(255),
                        PRIMARY KEY (Book_ID, Author),
                        FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Genre table (allowing multiple genres per book)
CREATE TABLE Genre (
                       Book_ID INT,
                       Genre VARCHAR(100),
                       PRIMARY KEY (Book_ID, Genre),
                       FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- Publisher table
CREATE TABLE Publisher (
                           Book_ID INT PRIMARY KEY,
                           Publisher VARCHAR(255),
                           FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

-- BookISBN table
CREATE TABLE BookISBN (
                          ISBN VARCHAR(13) PRIMARY KEY,
                          Book_ID INT UNIQUE,
                          FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);