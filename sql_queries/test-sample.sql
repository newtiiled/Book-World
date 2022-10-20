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

DELETE FROM users WHERE users.userID = 1;