# Book-World

Start-up involved (won't need to be replicated):

1. Download mamp (don't worry about the mamp pro free trial version it may automatically download)
2. node -v (if have it good, else download)
3. npm i express mysql cookie-parser jsonwebtoken dotenv hbs bcryptjs
4. npm i --save nodemon


To Run:
- Pull from main, run npm i
- Download mamp, have it running (click start)
- to start up app: npm start 
  - navigate to http://localhost:3000/
- mysql server should start up: http://localhost:8888/MAMP/?language=English
  - navigate to phpMyAdmin and find our db books-project
  - if db doesnt already exist, create new db: books-project
    - manually create User table using query
      - RUN: create_user_table.sql (https://github.com/kjamal01/CS348-Project/blob/main/sql_queries/create_user_table.sql)
    - Load in dataset CSV (Books table) (select "use 1st row as column names")
      - IMPORT: books-dataset.csv (https://github.com/kjamal01/CS348-Project/blob/main/sql_queries/books-dataset.csv)
- Should now be able to interact with our application completely
  
NOTE:
- For demo of functionality (Milestone 1): https://github.com/kjamal01/CS348-Project/pull/1
  - Funtionality has since changed. Updated functionality is in our Milestone 2 report document
- many sql scripts are embedded in the code. We will include references to them
  - The rest are linked or used in our db
  - Additionally, we created a folder in our repo that contains them (sql_queries)
  - Source dataset is called books-dataset.csv and is under the sql_queries folder

Features Done Milestone 2:

- Register User
- Sign-in User
- Sign-out User
- Delete User
- Display all books in database (if logged in)
  - Include buttons to add each book to either the user’s “want to read” or “Did read” lists to be displayed on their profiles
- User Profile Created
  - User profile has option to delete user (which signs them out)
  - User profile holds place to display a user’s 2 lists (“want to read” and “did read”)
 
NOTE: Most of this functionality is found in
 - https://github.com/kjamal01/CS348-Project/blob/main/controllers/auth.js (INCLUDING SQL)
 - https://github.com/kjamal01/CS348-Project/blob/main/routes/routes.js
 - UI Features are within their respective and specific files under: https://github.com/kjamal01/CS348-Project/tree/main/views
 - SQL queries: https://github.com/kjamal01/CS348-Project/tree/main/sql_queries
  
Completed all Fancy Features defined in fancy features section of report:


1) Well-designed/user-friendly interface:

- Sign In: If the user is not signed in already, the controller will redirect the user to the sign in page which has the option to go to the register page. Additionally, users are displayed with appropriate error messages if they entered an invalid username or password.

- Register: For users who end up on this page by mistake, can migrate back to the sign in page by clicking the “SIGN IN” button. For users who want to register an account with Books World, they can enter the required information in and press the “Register User”button.

- Home: After logging in users are displayed with a well-designed index view(Home page) where users will be able to migrate to their user profile, sign out, sign in and register page. Additionally, they can also click the “Browse All Books” button which will redirect them to a page where they can view all the books available on Books World.

- Access to Books: If a user tried to display all books without being signed in, they are redirected to the sign in page

- Books Page: On this page, logged in users will be greeted by their username and will be displayed a list of all the books available at Books World. This data is displayed in a table with columns providing information about the book’s Title, Author, Genre, Publisher, ID, Publish date, Description(pending), and feature to add the book to the user’s list of Read books or to their Reading list (pending) 

- User profile: This page greets the users with their name and username they entered while logging in. This page also has the option to migrate back to Home Page or sign out. 

- Additionally, all the pages are separated into well designed columns and tablets using Bootstrap to create a better UI for the end users. If user isnt signed it, they see a different menu bar than if they are signed in (ex: option to sign out)


2) Security: Password
- Due to the login feature of our web application, users have their own usernames and passwords for added security. This enables users to securely maintain their own Reading Lists without worrying about someone else changing their “Have Read” and “To Read” lists. This feature also allows Books World to ensure the privacy of users and ensure that only logged in users can view the list of books offered by our website.

- Password Confirmation: When signing up, users must enter a valid password, and must confirm it by typing it again. Our application catching if the password was not retyped correctly


3) Security: Encryption for password
- By encrypting the passwords stored in the DB, it ensures that in the unfortunate scenario of a data breach, the original passwords of the users are not leaked. This also adds on to the security as even the admins will not be able to view the passwords of the users. 
- We make use of an npm package called bcrypt that provides an encryption/hashing function that can mask our user’s passwords that they input into the register forms, and it can securely hash them into hashes of 60 characters before storing them securely into the database. 


4) Restricted Access
- Access to Books Features: If a user tries to display all books without being signed in, they are redirected to the sign in page. Only users who are logged in have access to our database of books and the application’s core functionality

