const express = require('express');
const usuarios = require('../controladores/usuarios');

const rotas = express();

rotas.get('/', (req, res) => {
    res.json('tudo certoss')
})

rotas.get('/usuarios', usuarios.listarUsuario);

rotas.post('/usuarios_login', usuarios.usuarios_login);

rotas.post('/usuarios', usuarios.cadastrarUsuario);

rotas.post('/usuarios/:id', usuarios.editarUsuario);

module.exports = rotas;