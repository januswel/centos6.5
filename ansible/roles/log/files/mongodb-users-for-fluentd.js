/*
 * Usage
 *  mongo fluentd fluentd-users-mongodb.js -u root -p root --authenticationDatabase admin
 * */

// User definitions to register
var newUsers = [
    {
        user: 'logger',
        pwd: 'logger',
        roles: [
            {
                role: 'readWrite',
                db: 'fluentd'
            }
        ]
    },
    {
        user: 'fluentd',
        pwd: 'fluentd',
        roles: [
            {
                role: 'dbOwner',
                db: 'fluentd'
            }
        ]
    }
];

// Check if initial settings are done
var currentUsers = db.getUsers();
if (currentUsers.length === newUsers.length) {
    quit();
}

// Drop users for database
db.dropAllUsers();

// Add users
for (var i = 0, length = newUsers.length; i < length; ++i) {
    db.createUser(newUsers[i]);
}
