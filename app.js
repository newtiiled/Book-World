const path = require('path');
const cookieparser = require("cookie-parser");

//.env stores all our sensitive info including db connection info
const dotenv = require('dotenv');
dotenv.config({path:'./.env'})

//import express server
const express = require("express");

//start app/server
const app = express();

//import mysql and create db on http://localhost:8888/phpMyAdmin5/
const mysql = require("mysql");

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    port: process.env.DB_PORT,
    database: process.env.DB

})

db.connect((error) => {
    if (error) {
        console.log(error)
    } else {
        console.log("mysql connected");
    }
})

//current directory joined with public so we have access to all our css
const public = path.join(__dirname, './public');
app.use(express.static(public));

//parse whatever is sent by html form
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(cookieparser());
//handle bars templates 
app.set('view engine', 'hbs');


//routes
app.use('/', require('./routes/routes'));
app.use('/auth', require('./routes/routes'));

//listening on port
app.listen(3000, () => {
    console.log("server running on port 3000");
})