# Database Normalization

## a) Definition of normalization and its importance

Normalization in database management systems is the process of organizing data to eliminate redundancy, reduce data anomalies, and ensure data integrity. It involves decomposing relations into smaller, well-structured relations that satisfy certain normal forms.

Normalization is essential for database design because it:

1. Minimizes data redundancy
2. Reduces data anomalies (insertion, update, and deletion)
3. Improves data consistency and integrity
4. Simplifies data maintenance
5. Enhances database flexibility for future changes

## b) Normalizing the relation

### 1NF
The relation is already in 1NF, assuming all attributes have atomic values.

### 2NF
- Books (Book_ID, Title, Publication_Year, ISBN, Price)
- Author (Book_ID, Author)
- Genre (Book_ID, Genre)
- Publisher (Book_ID, Publisher)

### 3NF
- Books (Book_ID, Title, Publication_Year, Price)
- Author (Book_ID, Author)
- Genre (Book_ID, Genre)
- Publisher (Book_ID, Publisher)
- BookISBN (ISBN, Book_ID)

### BCNF
The relations are already in BCNF, assuming Book_ID is the only key for each relation.

## c) Functional dependencies and how they're addressed

### 1NF
Ensures atomic values for all attributes.

### 2NF
- Removes partial dependencies
- FD: Book_ID → Title, Author, Genre, Publisher, Publication_Year, ISBN, Price
- Author, Genre, and Publisher are separated due to potential multi-valued dependencies

### 3NF
- Removes transitive dependencies
- New FD identified: ISBN → Book_ID
- ISBN is separated into its own relation

### BCNF
- Ensures every determinant is a candidate key
- Assumes Book_ID is the only determinant in each relation

## d) Advantages and drawbacks of higher normal forms

### Advantages
1. Reduced data redundancy
2. Improved data integrity and consistency
3. Easier data maintenance
4. Better support for schema changes
5. Minimized anomalies during operations

### Drawbacks
1. Increased number of tables, potentially complicating the schema
2. Possible performance impact on complex queries due to JOINs
3. May require more storage for keys in multiple tables
4. Can make some data retrieval more complicated

Generally, 3NF or BCNF are good targets, balancing integrity with performance. However, partial denormalization might be necessary for specific performance requirements or to simplify certain queries.