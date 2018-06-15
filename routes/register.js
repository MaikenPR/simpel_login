const User = require('../services/users');


/**
 * @module Register
 * @param {Object} app 
 */


module.exports = function(app){
    app.get('/register', (req, res) => {
        res.render('register', { 'page': { 'title': 'Register' } })
    });

    app.post('/register', async (req, res) => {
        console.log(req.body);
        const result = await User(req.body.username, req.body.password);
        if(result === true){
            res.send('Hooray!');
        } else{
            res.send('poop');
        }
        res.end();
    });
}