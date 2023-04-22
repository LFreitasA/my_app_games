const conexao = require('../conexao/conexao');
const securePassword = require('secure-password');
const jwt = require('jsonwebtoken');

const jwtSecret = require('../secret')

const pwd = securePassword();


const cadastrarUsuario = async (req, res) => {

    const { nome, email, dataNascimento, sexo, senha } = req.body;
    if (!nome) {
        return res.status(400).json('O campo nome é obrigatório')
    }
    if (!email) {

        return res.status(400).json('O campo nome é obrigatório')
    }
    if (!dataNascimento) {

        return res.status(400).json('O campo nome é obrigatório')
    }
    if (!sexo) {
        return res.status(400).json('O campo nome é obrigatório')
    }
    const hash = (await pwd.hash(Buffer.from(senha))).toString('hex');

    try {
        const buscarEmail = 'select from usuarios where email = $1'
        const contemEmail = await conexao.query(buscarEmail, [email])
        console.log()
        if (contemEmail.rows.length != 0) {
            console.log("ta na base");
            return res.status(499).json({ "Erro": "E-mail já cadastrado" })
        }
        const query = 'insert into usuarios (nome, email, data_nascimento, sexo, senha) values ($1, $2, $3, $4, $5) RETURNING *'
        const usuario = await conexao.query(query, [nome, email, dataNascimento, "sexo", hash])

        if (usuario.rowCount == 0) {
            return res.status(400).json({ "Error": "Não foi possível cadastrar o usuário" })
        }
        return res.status(200).json({ "Sucesso": "cadastrado com sucesso" })
    } catch (error) {
        console.log("deu erro")
        console.log(error.message)
        return res.status(405).json(error.message);
    }
}
const listarUsuario = async (req, res) => {
    const usuarios = await conexao.query('select * from usuarios');
    res.json(usuarios.rows);

}
const usuarios_login = async (req, res) => {
    const { email, senha } = req.body;

    try {
        const buscarEmail = 'select * from usuarios where email = $1 '
        const contemEmail = await conexao.query(buscarEmail, [email])

        let user = contemEmail.rows[0];

        const result = await pwd.verify(
            Buffer.from(senha),
            Buffer.from(user.senha, 'hex')
        );
        console.log(user)


        switch (result) {
            case securePassword.INVALID_UNRECOGNIZED_HASH:
            case securePassword.INVALID:
                return res.status(400).json({ "Erro": "Usuário ou senha inválidos" })
            case securePassword.VALID:
                break;
            case securePassword.VALID_NEEDS_REHASH:
        }
        console.log(result)
        let { senha: password, ...userWithoutPassword } = user;
        const token = jwt.sign(
            {
                id: user.id,
                nome: user.nome,
                email: user.email
            },
            jwtSecret,
            {
                expiresIn: '2h'
            }
        );
        console.log(token)

        return res.status(200).json({
            user: userWithoutPassword,
            token: token
        });

    } catch (error) {
        return res.status(405).json(error.message);
    }

}
const editarUsuario = async (req, res) => { }

module.exports = {
    cadastrarUsuario, listarUsuario, usuarios_login, editarUsuario
}