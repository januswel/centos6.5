/*
 * Usage
 *  mongo admin init-mongodb.js
 * */

// Check if user "root" is registered
var authed = db.auth('root', 'root');
if (authed === 1) {
    quit();
}

// Register root
db.createUser({
    user: 'root',
    pwd: 'root',
    roles: [
        {
            role: 'root',
            db: 'admin'
        }
    ]
});
