import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  const Botao({
    super.key,
    required this.botaoNome,
    required this.rotaNome,
  });
  final String botaoNome;
  final String rotaNome;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(rotaNome);
          },
          child: Text(botaoNome)),
    );
  }
}
