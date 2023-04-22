import 'package:flutter/material.dart';

import '../../ui/pages/components/mostrar_dialog.dart';
import '../model/logar_usuario_model.dart';

void realizarLogin(context,
    {required emailController,
    required senhaController,
    required autenticacaoServices}) async {
  final user = LogarUsuarioModel(
      email: emailController.text, senha: senhaController.text);
  final data = await autenticacaoServices.logarUsuario(user);
  if (data == 200) {
    return mostrarDialog(context, funcao: () {
      loginSucess(context);
    }, title: "Sucesso", contexto: "#");
  } else {
    return mostrarDialog(context, funcao: () {
      loginFailed(context);
    }, title: "Erro", contexto: "Deu ruim");
  }
}

void loginSucess(context) {
  Navigator.of(context).pushReplacementNamed('/home_logada');
}

void loginFailed(context) {
  Navigator.of(context).pop();
}
