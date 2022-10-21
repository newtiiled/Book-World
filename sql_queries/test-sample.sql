-- Feature 1: Create new account

SELECT * FROM users;

SET @userLen = (SELECT COUNT(*) FROM users);
SET @idLen = @userLen + 1;

INSERT INTO users VALUES(@idLen, 'john23', 'pass123', 'John', NULL, NULL);

SELECT * FROM users;

-- Feature 2: Search for any book out of our db

SELECT * FROM Books WHERE bookID = [bookid];

-- Feature 3: Add book to list of books read

CREATE VIEW CurrUserDidRead AS
	SELECT * FROM DidRead
	WHERE userid = [current user’s userid];

INSERT INTO CurrUserDidRead VALUES ( [userid], [bookid]);

CREATE TRIGGER AddDidReadBookToUser
	INSTEAD OF INSERT INTO CurrUserDidRead
	INSERT INTO DidRead VALUES ( [userid], [bookid]);

INSERT INTO DidRead VALUES ( [userid], [bookid]);

-- Feature 4: Delete Account

-- Inserting Sample Data for deletion
INSERT INTO Books VALUES(20,'Data Smart', 'Foreman, John', NULL, 'data_science', 2014);
INSERT INTO Books VALUES(21,'God Created the Integers', 'Hawking, Stephen', NULL, 'mathematics', 2013);
INSERT INTO Users VALUES(11, 'testUserToDelete', '123Pass', 'Sam', 'Data Smart', 'Horror');
INSERT INTO DidRead VALUES(11, 20, 0, '10-14-2022');
INSERT INTO ToRead VALUES(11, 21);

-- Delete removes rows with userID = 11 from Users, DidRead, and ToRead tables
-- Due to foreign key reference on delete cascade on DidRead and ToRead tables
DELETE FROM users WHERE users.userID = 11;
