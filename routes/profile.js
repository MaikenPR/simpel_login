const authenticate = require('../middleware/authenticate');

module.exports = function (app) {
    app.get('/profile',  authenticate, (req, res) => {
        res.render('profile', { 'page': { 'title': 'Profile' } });
    });
};



/** 
 * Det her bruges når authenticate ikke bruges.
 * 
module.exports = function(app){
    app.get('/profile', (req, res) => {
        if(req.session && req.session.isLoggedIn){
            res.render('profile', { 'page': { 'title': 'Profile' } });
        } else{
            res.redirect('/login');
        }
    });
}
*/