
const mysql = require('mysql2');

const connection  = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '12345678',
    database: 'dummy_database'
})

connection.connect((err)=> {
    if(err) {
        console.log(err)
    }
    else {
        console.log('Database connected successfully')
    }
})

// Query database example
connection.query('SELECT * FROM customer', (err, rows) => {
    if(err) {
        console.log(err)
    }
    else {
        console.log(rows)
    }
})
