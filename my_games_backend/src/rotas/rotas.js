const express = require('express');
const usuarios = require('../controladores/usuarios');

const rotas = express();

rotas.get('/', (req, res) => {
    res.json('tudo certoss')
})

rotas.get('/usuarios', usuarios.listarUsuario);

rotas.get('/usuarios/:id', usuarios.obterUsuario);

rotas.post('/usuarios/', usuarios.cadastrarUsuario);

rotas.put('/usuarios/:id', usuarios.editarUsuario);

module.exports = rotas;