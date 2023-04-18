import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_games/app/data/repository/repository.dart';
import 'package:my_games/app/ui/pages/cadastro.dart';
import 'package:my_games/app/ui/pages/components/botao_personalizado.dart';
import 'package:my_games/app/ui/pages/components/build_app.dart';
import 'package:my_games/app/ui/pages/components/campo_de_texto.dart';
import 'package:my_games/app/ui/pages/home/home_page.dart';
import 'package:my_games/app/ui/pages/login/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    Provider(
      create: (context) => UsuariosRepositorio(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: '/initial',
        routes: {
          '/initial': (context) => const BuildApp(myFunctionality: HomePage()),
          '/esqueciMinhaSenha': (context) =>
              BuildApp(myFunctionality: EsqueciMinhaSenha()),
          '/cadastrar': (context) =>
              const BuildApp(myFunctionality: Cadastrar()),
          '/login': (context) => BuildApp(myFunctionality: Login()),
        },
        home: const BuildApp(myFunctionality: HomePage()));
  }
}

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
        Botao(botaoNome: "Confirmar", rotaNome: "/initial"),
      ],
    );
  }
}
