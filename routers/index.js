const router = require('express').Router();
const client = require('../database');

router.post('/api/add_guest', (req, res) => {
    const data = { nama_tamu: req.body.nama, 
                   jenis_kelamin: req.body.genderSelect, 
                   email: req.body.email, 
                   alamat: req.body.alamat,
                   tanggal: new Date(),
                   pesan: req.body.pesan };
    const sql = `INSERT INTO guestbook(nama_tamu, jenis_kelamin, email, alamat, tanggal, pesan) VALUES($1, $2, $3, $4, $5, $6) RETURNING *`;
    const values = [data.nama_tamu, data.jenis_kelamin, data.email, data.alamat, data.tanggal, data.pesan];
    client.query(sql, values, (err, result) => {
        if(err) throw err;
        console.log(result.rows[0])
        res.send(result.rows[0])
    });
}),

router.get('/api/get_guest', (req, res) => {
    const sql = 'SELECT * FROM guestbook ORDER BY id_tamu ASC';
    client.query(sql, (err, result) => {
        if(err) throw err;
        res.send(result.rows)
    } )
}),

router.put('/api/guest/:id', (req, res) => {
    const data = { nama_tamu: req.body.nama_update, 
        jenis_kelamin: req.body.jenis_kel_changes, 
        email: req.body.email_update, 
        alamat: req.body.alamat_update,
        tanggal: new Date(),
        pesan: req.body.pesan_update };
    const sql = `UPDATE guestbook SET nama_tamu=($1), jenis_kelamin=($2), email=($3), alamat=($4), tanggal=($5), pesan=($6) WHERE id_tamu=${req.params.id} RETURNING *`;
    const values = [data.nama_tamu, data.jenis_kelamin, data.email, data.alamat, data.tanggal, data.pesan];
    client.query(sql, values, (err, result) => {
        if(err) throw err;
        console.log(`Edit tamu sukses, menjadi:`, result.rows[0].nama_tamu)
        res.send(result.rows[0]);
    })
}),

router.delete('/api/guest/:id', (req, res) => {
    const sql = `DELETE FROM guestbook WHERE id_tamu=${req.params.id}`
    client.query(sql, (err, result) => {
        if(err) throw err;
        console.log(result.rows)
        res.send({status: "hapus tamu sukses"})
    })
})

module.exports = router;