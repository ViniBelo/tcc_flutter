enum Sexo {
  nenhum(sexo: ''),
  homem(sexo: 'Homem'),
  mulher(sexo: 'Mulher');

  const Sexo({required this.sexo});

  final String sexo;
}
