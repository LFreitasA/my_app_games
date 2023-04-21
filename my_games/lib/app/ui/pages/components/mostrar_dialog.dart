import 'package:flutter/material.dart';

Future<dynamic> mostrarDialog(BuildContext context,
    {required funcao, required String title, required String contexto}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(contexto),
        actions: [TextButton(onPressed: funcao, child: const Text("OK"))],
      );
    },
  );
}
