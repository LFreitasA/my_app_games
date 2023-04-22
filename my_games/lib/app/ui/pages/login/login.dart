import 'package:flutter/material.dart';
import 'package:my_games/app/data/login/login_logica.dart';
import 'package:my_games/app/data/model/logar_usuario_model.dart';
import 'package:my_games/app/ui/pages/components/campo_de_texto.dart';
import 'package:my_games/app/ui/pages/components/mostrar_dialog.dart';
import 'package:provider/provider.dart';

import '../../../data/autenticacao_services.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController senhaController = TextEditingController();

  late final AutenticacaoServices _autenticacaoServices = context.read();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Informe os dados para realizar o login"),
        CampoDeTexto(
            controller: emailController,
            hintText: "Informe seu e-mail",
            labelText: "E-mail",
            obscureText: false,
            icone: null),
        CampoDeTexto(
            controller: senhaController,
            hintText: "Informe sua senha",
            labelText: "Senha",
            obscureText: true,
            icone: null),
        const SizedBox(
          height: 35,
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () async {
                  realizarLogin(context,
                      emailController: emailController,
                      senhaController: senhaController,
                      autenticacaoServices: _autenticacaoServices);
                },
                child: const Text("Login"))
          ],
        )
      ],
    );
  }
}
