import 'package:flutter/material.dart';
import 'package:my_games/app/data/autenticacao_services.dart';
import 'package:my_games/app/ui/pages/components/campo_de_texto.dart';
import 'package:my_games/app/ui/pages/components/strings.dart';
import 'package:provider/provider.dart';

import '../../../data/cadastro/cadastro_logica.dart';
import '../components/mostrar_dialog.dart';

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

  late final AutenticacaoServices _autenticacaoServices = context.read();
  @override
  Widget build(BuildContext context) {
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
              onPressed: () async {
                bool chamadaApiConcluida = false;
                if (senhaController.text.isEmpty ||
                    confirmacaoSenhaController.text.isEmpty) {
                  mostrarDialog(context,
                      funcao: () => fecharPopUp(context),
                      title: Strings.errorTitle,
                      contexto: Strings.camposObrigatorios);
                } else if (senhaController.text ==
                    confirmacaoSenhaController.text) {
                  final sucesso = await submit(
                      autenticacaoServices: _autenticacaoServices,
                      nomeController: nomeController,
                      emailController: emailController,
                      dataNascimentoController: dataNascimentoController,
                      senhaController: senhaController,
                      confirmacaoSenhaController: confirmacaoSenhaController);
                  chamadaApiConcluida = true;
                  if (sucesso == 200) {
                    mostrarDialog(context,
                        funcao: () => cadastroRealizado(context,
                            nomeController: nomeController,
                            emailController: emailController,
                            dataNascimentoController: dataNascimentoController,
                            senhaController: senhaController,
                            confirmacaoSenhaController:
                                confirmacaoSenhaController),
                        title: Strings.sucesso,
                        contexto: Strings.cadastroSucesso);
                  } else {
                    mostrarDialog(context,
                        funcao: () => fecharPopUp(context),
                        title: "title",
                        contexto: "contexto");
                  }
                } else {
                  mostrarDialog(context,
                      funcao: () => senhasDiferentes(context,
                          senhaController: senhaController,
                          confirmacaoSenhaController:
                              confirmacaoSenhaController),
                      title: Strings.errorTitle,
                      contexto: Strings.senhasDiferentes);
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
