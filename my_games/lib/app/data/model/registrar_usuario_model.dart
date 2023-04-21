class RegistrarUsuarioModel {
  final String nome;
  final String email;
  final String dataNascimento;
  final String senha;

  RegistrarUsuarioModel(
      {required this.email,
      required this.nome,
      required this.dataNascimento,
      required this.senha});
}
