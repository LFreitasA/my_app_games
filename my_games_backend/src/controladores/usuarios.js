const conexao = require('../conexao/conexao')

const cadastrarUsuario = async (req, res) => {
    console.log("chegou aqui")
    console.log(req.body)

    const { nome, email, dataNasicmento, sexo, senha } = req.body;
    if (!nome) {
    console.log("chegou nome")
    console.log("nova rodada")
        
        return res.status(400).json('O campo nome é obrigatório')
        
    }
    if (!email) {
    console.log("chegou email")

        return res.status(400).json('O campo nome é obrigatório')
    }
    if (!dataNasicmento) {
    console.log("chegou dataNasicmento")

        return res.status(400).json('O campo nome é obrigatório')
    }
    if (!sexo) {
    console.log("chegou sexo")

        return res.status(400).json('O campo nome é obrigatório')
    }
    if (!senha) {
    console.log("chegou senha")

        return res.status(400).json('O campo nome é obrigatório')
    }
    console.log("chegou aqui")

    try {
        const query = 'insert into usuarios (nome, email, dataNascimento, sexo, senha) values ($1, $2, $3, $4, $5)'
        const usuario = await conexao.query(query, [nome, email, dataNasicmento, sexo, senha])
        if (usuario.rowCount == 0) {
            return res.status(400).json({"Error": "Não foi possível cadastrar o usuário"})
        }
    return res.status(200).json({"Sucesso": "Autor cadastrado com sucesso"})
    } catch (error) {
        console.log("deu erro")
        return res.status(400).json(error.message);
    }
}
const listarUsuario = async (req, res) => {
    const usuarios = await conexao.query('select * from usuarios');
    res.json(usuarios.rows);
    
}
const obterUsuario = async (req, res)=>{}
const editarUsuario = async (req, res) => { }

module.exports = {
    cadastrarUsuario, listarUsuario, obterUsuario, editarUsuario
}