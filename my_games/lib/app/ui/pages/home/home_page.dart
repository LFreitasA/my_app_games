import 'package:flutter/material.dart';
import 'package:my_games/app/ui/pages/components/botao_personalizado.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Seja bem vindo!"),
          Botao(
            botaoNome: "Login",
            rotaNome: "/login",
          ),
          Botao(
            botaoNome: "Cadastrar",
            rotaNome: "/cadastrar",
          ),
          Botao(
            botaoNome: "Esqueci minha senha",
            rotaNome: "/esqueciMinhaSenha",
          )
        ],
      ),
    );
  }
}
