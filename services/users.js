const db = require('../config/database').connect();
const Hash = require('./hash');

const User = function (username, password) {
    return new Promise(async (resolve, reject) => {
        const hash = await Hash(password);
        db.execute('INSERT INTO users SET username = ?, password = ?', [username, hash], (err, result) => {
            if (err) reject(err);
            console.log(result);
            resolve(true);
        });
    });
};

User.valid = function (username, password) {
    return new Promise((resolve, reject) => {
        db.execute('SELECT id, password FROM users WHERE username = ?', [username], async (err, result) => {
            if (err) reject(err);
            if(result[0] === undefined) reject('invalid stuffs');
            if (await Hash.compare(password, result[0].password)) {
                resolve(result[0].id);
            } else {
                reject('invalid password or username');
            }
        });
    });
};

module.exports = User;