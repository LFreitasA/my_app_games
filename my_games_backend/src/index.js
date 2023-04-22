const express = require('express');
const cors = require('cors')
const rotas = require('./rotas/rotas')
const app = express();

/*app.use((req, res, next) => {
    console.log("Midware")
    res.header("Access-Control-Allow-Origin", "*");
    app.use(cors());
    next()
})*/

app.use(cors());

app.use(express.json());

app.use(rotas);

app.listen(3000);