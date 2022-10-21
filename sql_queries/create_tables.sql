CREATE DATABASE app;
USE app;

CREATE TABLE Books(bookID INT NOT NULL PRIMARY KEY, 
                    title CHAR(100) NOT NULL, 
                    author CHAR(200) NOT NULL, 
                    description TEXT, 
                    genres CHAR(200), 
                    publishDate CHAR(20));

CREATE TABLE Users(userID INT NOT NULL PRIMARY KEY, 
                    username CHAR(200) NOT NULL UNIQUE, 
                    userPassword CHAR(100) NOT NULL, 
                    firstName CHAR(200) NOT NULL, 
                    favBook char(200), 
                    favGenre CHAR(200));

CREATE TABLE ToRead(userID INT NOT NULL REFERENCES Users(userID), 
                    bookID INT NOT NULL REFERENCES Books(bookID),
                    PRIMARY KEY(userID, bookId),
                    foreign key (userID) references Users(userID) on delete cascade,
                    foreign key (bookID) references Books(bookID) on delete cascade);

CREATE TABLE DidRead(userID INT NOT NULL REFERENCES Users(userID), 
                    bookID INT NOT NULL REFERENCES Books(bookID), 
                    rating INT, 
                    dateFinished CHAR(20),
                    PRIMARY KEY(userID, bookId),
                    foreign key (userID) references Users(userID) on delete cascade,
                    foreign key (bookID) references Books(bookID) on delete cascade);
                    
