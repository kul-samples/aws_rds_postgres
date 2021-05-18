const os = require('os');
exports.index = function (req, res) {
    res.render('index', { title: 'NodeJs & PostgreSQL Application running on '+os.hostname() });
};