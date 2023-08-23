enum Sexo {
  nenhum(sexo: ''),
  masculino(sexo: 'Masculino'),
  feminino(sexo: 'Feminino');

  const Sexo({required this.sexo});

  final String sexo;
}
