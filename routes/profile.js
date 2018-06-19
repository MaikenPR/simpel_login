const authenticate = require('../middleware/authenticate');
const db = require('../config/database').connect();
const Hash = require('../services/hash');
const User = require('../services/users');

// READ - hent bruger
module.exports = function (app) {
    app.get('/profile', authenticate, async (req, res) => { //authenticate bestemmer om man skal være logget ind eller ej for at kunne se siden
        try{
            const username = await User.getOne(req.session.isLoggedIn.id);
            res.render('profile', {'page': {'title': 'Profile'}, 'content': {'username': username}})
        } catch(error){
            res.send(error);
        }
    });

    //UPDATE - Rediger bruger
    app.post('/profile/update', authenticate, async (req, res) => {
        try{
            await User.update(req.session.isLoggedIn.id, req.body.password)
            res.send('Dit password er ændret');
            
        } catch(error){
            res.send('Der skete en fejl');
        }
    });

    //DELETE - Slet bruger
    app.get('/profile/delete', authenticate, async (req, res) => {
       try{
            await User.deleteOne(req.session.isLoggedIn.id);
            req.session.destroy((err) => {
                res.send('Din bruger er slettet. Goodbye!');
            });
       } catch(error){
            res.send(error);
       }
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