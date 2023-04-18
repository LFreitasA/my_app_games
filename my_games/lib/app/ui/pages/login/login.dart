import 'package:flutter/material.dart';
import 'package:my_games/app/ui/pages/components/campo_de_texto.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Informe os dados para realizar o login"),
        CampoDeTexto(
            controller: email,
            hintText: "Informe seu e-mail",
            labelText: "E-mail",
            obscureText: false,
            icone: null),
        CampoDeTexto(
            controller: senha,
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
                onPressed: () {
                  if (email.text == "a" && senha.text == "a") {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Sucesso"),
                          content: const Text(
                              "Login realizado com sucesso --aguardando o restante da implementação"),
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
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Erro"),
                          content: const Text("E-mail e/ou Senha incorrectos"),
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
                  }
                },
                child: const Text("Login"))
          ],
        )
      ],
    );
  }
}
