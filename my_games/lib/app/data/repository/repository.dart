import 'dart:convert';

import 'package:dio/dio.dart';

class UsuariosRepositorio {
  Future<dynamic> cadastrarUsuario(
      nome, email, dataNascimento, sexo, senha) async {
    Dio dio = Dio();
    try {
      print(nome);
      print("Chamar api");
      final response = await dio.post(
        'http://localhost:3000/usuarios',
      );
      print("response.toString()");
      print(response.toString());
      print("passou");
      return response;
    } on FormatException catch (error) {
      print("error.message");
      print(error.message);
      print("error.source");
      print(error.source);
      return error;
    }
  }
}
