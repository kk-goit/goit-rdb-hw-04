USE `LibraryManagement`;

INSERT INTO authors
	(author_name)
VALUES
	('Stiven King'), 
    ('Lenin (Ulianov)');
    
INSERT INTO genres
	(genre_name)
VALUES 
	('horor'), 
    ('politic');
    
INSERT INTO books
	(title, publication_year, author_id, genre_id)
VALUES
	('Black Tower', 2000, 1, 1),
    ('Terror of the labours', 1921, 2, 2);
    
INSERT INTO users
	(username, email)
VALUES
	('Stalin', 'gulag@kremlin.su'),
    ('Anonimous', 'no-replay@yahoo.com');
    
INSERT INTO borrowed_books
	(book_id, user_id, borrow_date, return_date)
VALUES
	(2, 1, '1917-11-07', '1953-03-05'),
    (1, 2, '2025-02-08', null);
    