const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const client = require('./database')

var app = express({defaultErrorHandler: false});

var port = process.env.PORT || 1990;

app.use(cors());
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    res.send('<h1> Selamat Datang di API GuestBook');
})

const routes = require('./routers');
app.use('/', routes);

client.connect()
  .then(() => console.log('Koneksi postgresql sukses'))
  .catch(err => console.log('Gagal koneksi' + err))

app.listen(port, () => console.log('API Aktif di port' + port))