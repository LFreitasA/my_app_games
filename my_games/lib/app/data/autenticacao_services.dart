import 'dart:async';

import 'package:my_games/app/data/enum/autenticacao_status_enum.dart';
import 'package:my_games/app/data/http_client/services_http_client.dart';
import 'package:my_games/app/data/model/registrar_usuario_model.dart';

class AutenticacaoServices {
  final ServicesHttpClient _httpClient;
  final _autenticacaoController = StreamController<AuteticacaoEnum>()
    ..add(AuteticacaoEnum.aguardando);

  AutenticacaoServices({
    required ServicesHttpClient httpClient,
  }) : _httpClient = httpClient;

  Future registrarUsuario(RegistrarUsuarioModel model) async {
    try {
      final data = await _httpClient.post('/usuarios', body: {
        'nome': model.nome,
        'senha': model.senha,
        'sexo': "masculino",
        'dataNascimento': model.dataNascimento,
        'email': model.email
      });
      print("data");
      print(data);
      if (data == 200) {
        return data;
      }
    } catch (error) {
      rethrow;
    }
  }

  Stream<AuteticacaoEnum> get status => _autenticacaoController.stream;
}
