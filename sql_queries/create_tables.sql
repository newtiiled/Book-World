CREATE DATABASE app;
USE app;

CREATE TABLE Books(bookID INT NOT NULL PRIMARY KEY, 
                    title CHAR(100) NOT NULL, 
                    author CHAR(200) NOT NULL, 
                    description TEXT, 
                    genres CHAR(200), 
                    publishDate CHAR(20));

CREATE TABLE ToRead(userID INT NOT NULL REFERENCES user(id), 
                    bookID INT NOT NULL REFERENCES Books(ID),
                    PRIMARY KEY(userID, bookID),
                    foreign key (userID) references user(id) on delete cascade,
                    foreign key (bookID) references Books(ID) on delete cascade);

CREATE TABLE DidRead(userID INT NOT NULL REFERENCES user(id), 
                    bookID INT NOT NULL REFERENCES Books(ID), 
                    PRIMARY KEY(userID, bookId),
                    foreign key (userID) references user(id) on delete cascade,
                    foreign key (bookID) references Books(ID) on delete cascade);
                    
