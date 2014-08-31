/*
 * Usage
 *  mongo admin mongodb-admin.js
 *
 * A script to add administration user
 * */

var USERNAME = 'root';
var PASSWORD = 'root';

// Check if user is registered
var authed = db.auth(USERNAME, PASSWORD);
if (authed === 1) {
    quit();
}

// Register user
db.createUser({
    user: USERNAME,
    pwd: PASSWORD,
    roles: [
        {
            role: 'root',
            db: 'admin'
        }
    ]
});
