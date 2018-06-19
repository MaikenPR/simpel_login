const User = require('../services/users');

/**
 * @module Login
 * @param {Object} app 
 */
module.exports = function (app) {
	app.get('/login', (req, res) => {
		res.render('login', { 'page': { 'title': 'Login' } });
	});

	
	app.post('/login', async (req, res) => {
		try {
			const valid = await User.valid(req.body.username, req.body.password);
			// valid ? res.send('EXCELSIOR!!') : res.send('sure sokker'); //ternery expression; en forkortet måde at skrive en if/else "betingelse ? true: false"
			if(valid){
				req.session.isLoggedIn = {id: valid};
				res.redirect('/profile');
			} else{
				req.session.isLoggedIn = false;
				res.send('sure sokker');
			}
		} catch (error) {
			res.send(error);
		}
	});
	

	app.get('/logout', (req, res) => {
		req.session.destroy((err) => {
			res.redirect('/');
		})
	})
};
