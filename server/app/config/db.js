const mysql = require('config/node_modules/mysql')
const dbconfig = require('config/dbconfig')

const connectDB = function() {
    var connection = mysql.createConnection({
        host:dbconfig.host,
        user: dbconfig.user,
        password: dbconfig.password,
        database: dbconfig.DB
    })
    connection.connect((err)=>{
        if(err){
            return console.log(err)
        }
        console.log(`Coneected to Database`)
    })
}

module.exports = connectDB