enum Estimativas {
  homemBranco(imageAdress: 'assets/images/hHomemBranco.png'),
  homemNegro(imageAdress: 'assets/images/hHomemNegro.png'),
  mulherBranca(imageAdress: 'assets/images/hMulherBranca.png'),
  mulherNegra(imageAdress: 'assets/images/hMulherNegra.png');

  const Estimativas({required this.imageAdress});

  final String imageAdress;
}
