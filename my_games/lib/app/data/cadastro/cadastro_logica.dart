import 'package:flutter/material.dart';

import '../model/registrar_usuario_model.dart';

void limparOsCampos(
    {required nomeController,
    required emailController,
    required dataNascimentoController,
    required senhaController,
    required confirmacaoSenhaController}) {
  nomeController.clear();
  emailController.clear();
  dataNascimentoController.clear();
  senhaController.clear();
  confirmacaoSenhaController.clear();
}

void cadastroRealizado(context,
    {required nomeController,
    required emailController,
    required dataNascimentoController,
    required senhaController,
    required confirmacaoSenhaController}) {
  limparOsCampos(
      nomeController: nomeController,
      emailController: emailController,
      dataNascimentoController: dataNascimentoController,
      senhaController: senhaController,
      confirmacaoSenhaController: confirmacaoSenhaController);
  Navigator.of(context).pushReplacementNamed('/homeLogada');
}

void senhasDiferentes(
  context, {
  required senhaController,
  required confirmacaoSenhaController,
}) {
  senhaController.clear();
  confirmacaoSenhaController.clear();
  fecharPopUp(context);
}

Future submit(
    {required autenticacaoServices,
    required nomeController,
    required emailController,
    required dataNascimentoController,
    required senhaController,
    required confirmacaoSenhaController}) async {
  final user = RegistrarUsuarioModel(
      email: emailController.text,
      nome: nomeController.text,
      dataNascimento: dataNascimentoController.text,
      senha: senhaController.text);
  final data = await autenticacaoServices.registrarUsuario(user);
  return data;
}

void fecharPopUp(context) {
  Navigator.of(context).pop();
}
