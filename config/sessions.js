const session = require('express-session');
const debug = require('debug')('app:sessions');

/**
 * @module Sessions
 * @param {Object} app 
 */
module.exports = async function (app) {
		app.use(session({
			'resave': false,
			'saveUninitialized': true,
			'secret': 'default secret'
		}));
	
};
