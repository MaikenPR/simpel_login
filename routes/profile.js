module.exports = function(app){
    app.get('/profile', (req, res) => {
        if(req.session && req.session.isLoggedIn){
            res.render('profile', { 'page': { 'title': 'Profile' } });
        } else{
            res.redirect('/login');
        }
    });
}