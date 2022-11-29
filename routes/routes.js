//import express server
const express = require("express");
//start router
const router = express.Router();

const authController = require("../controllers/auth");

//route
router.get("/", authController.signedIn, (req, res) => {
    res.render("index", {
        user: req.user
    });
});

//route
router.get("/register", (req, res) => {
    res.render("register")
});

//route
router.get("/signin", (req, res) => {
    res.render("signin")
});

//route
router.get("/userProfile", authController.listDidRead, (req, res) => {
    // console.log("authController.listDidRead: ", authController.listDidRead);
    // console.log("authController.signedIn: ", authController.signedIn);

    if (req.user) {
        res.render("userProfile", {
            user: req.user,
            // listDidRead: authController.listDidRead
        });
        // res.render("listDidRead");
    } else {
        res.redirect("/signin");
    }
});

//listBooks if signed in
router.get("/listBooks", authController.listBooks, (req, res) => {
    if (req.user) {
        res.render("listBooks");
    } else {
        res.redirect("/signin");
    }
});

//auth routes

//route post, when submitting a form
//like auth/register
router.post("/auth/listBooks", authController.listBooks);
router.post("/auth/listDidRead", authController.listDidRead);
router.post("/auth/register", authController.register);
router.post("/auth/signin", authController.signin);
router.get("/auth/signout", authController.signout);

 
module.exports = router;
