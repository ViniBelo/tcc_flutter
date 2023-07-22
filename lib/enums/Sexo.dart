enum Sexo {
  homem(sexo: 'Homem'),
  mulher(sexo: 'Mulher');

  const Sexo({required this.sexo});

  final String sexo;
}
