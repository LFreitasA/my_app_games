import 'package:flutter/material.dart';
import 'package:my_games/app/data/repository/repository.dart';
import 'package:my_games/app/ui/pages/components/campo_de_texto.dart';
import 'package:provider/provider.dart';

class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _CadastrarState();
}

class _CadastrarState extends State<Cadastrar> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController confirmacaoSenhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    void limparOsCampos() {
      nomeController.clear();
      emailController.clear();
      dataNascimentoController.clear();
      senhaController.clear();
      confirmacaoSenhaController.clear();
    }

    void limparAsSenhas() {
      senhaController.clear();
      confirmacaoSenhaController.clear();
    }

    final dados = context.read<UsuariosRepositorio>();
    return Column(
      children: [
        const Text("Cadastro"),
        CampoDeTexto(
          controller: nomeController,
          hintText: "Informe o seu nome",
          labelText: "Nome",
          obscureText: false,
          icone: const Icon(Icons.person),
        ),
        CampoDeTexto(
          controller: dataNascimentoController,
          hintText: "Informe o seu Data nascimento",
          labelText: "Data Nascimento",
          obscureText: false,
          icone: null,
        ),
        CampoDeTexto(
          controller: emailController,
          hintText: "Informe o seu email",
          labelText: "E-mail",
          obscureText: false,
          icone: null,
        ),
        CampoDeTexto(
          controller: senhaController,
          hintText: "Informe o seu senha",
          labelText: "Senha",
          obscureText: true,
          icone: null,
        ),
        CampoDeTexto(
          controller: confirmacaoSenhaController,
          hintText: "Confirme sua senha",
          labelText: "Confirmação de senha",
          obscureText: true,
          icone: null,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                if (senhaController.text.isEmpty ||
                    confirmacaoSenhaController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Erro"),
                        content: const Text(
                            "Um ou mais campos obrigatórios não foram preenchidos"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"))
                        ],
                      );
                    },
                  );
                } else if (senhaController.text ==
                    confirmacaoSenhaController.text) {
                  FutureBuilder(
                    future: dados.cadastrarUsuario(
                        nomeController.text,
                        emailController.text,
                        dataNascimentoController.text,
                        "Masculino",
                        senhaController.text),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      return Text("data");
                    }),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Erro"),
                        content: const Text(
                            "As senhas não são iguais, por favor verifique as senhas informadas"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                limparAsSenhas();
                                Navigator.of(context).pop();
                              },
                              child: const Text("OK"))
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Cadastrar"),
            ),
          ],
        )
      ],
    );
  }
}
