import 'package:flutter/material.dart';

import '../components/botao_personalizado.dart';
import '../components/campo_de_texto.dart';

class EsqueciMinhaSenha extends StatelessWidget {
  EsqueciMinhaSenha({super.key});
  TextEditingController emailRecovery = TextEditingController();
  TextEditingController dataNascimentoRecovery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text("Recuperar sua senha"),
        CampoDeTexto(
            controller: emailRecovery,
            hintText: "E-mail",
            labelText: "Informe o e-mail cadastrado",
            icone: null,
            obscureText: false),
        CampoDeTexto(
            controller: emailRecovery,
            hintText: "Data Nascimentol",
            labelText: "Informe a sua data de nascimento",
            icone: null,
            obscureText: false),
        const Botao(botaoNome: "Confirmar", rotaNome: "/initial"),
      ],
    );
  }
}
