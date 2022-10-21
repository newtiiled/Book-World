# CS348-Project

Start-up involved (won't need to be replicated):

1. Download mamp (don't worry about the mamp pro free trial version it may automatically download)
2. node -v (if have it good, else download)
3. npm i express mysql cookie-parser jsonwebtoken dotenv hbs bcryptjs
4. npm i --save nodemon


To run:
- Pull from main, run npm i
- Download mamp, have it running (click start)
- to start up app: npm start 
  - navigate to http://localhost:3000/
- mysql server should start up: http://localhost:8888/MAMP/?language=English
  - navigate to phpMyAdmin and find our db books-project
- If first time running, our db may not be setup, so run SQL queries in the phpMyAdmin to setup the basic user table for login/profile      creation
  - RUN: create_user_table.sql (https://github.com/kjamal01/CS348-Project/blob/main/sql_queries/create_user_table.sql)
  
NOTE:
- many sql scripts are embedded in the code. We will include references to them
  - The rest are linked or used in our db
  - Additionally, we can create a folder in our repo that contains them
