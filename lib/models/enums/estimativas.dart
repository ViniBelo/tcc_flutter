enum Estimativas {
  homemBranco(imageAdressAltura: 'assets/images/hHomemBranco.png', imageAdressPeso: 'assets/images/wHomemBranco.png'),
  homemNegro(imageAdressAltura: 'assets/images/hHomemNegro.png', imageAdressPeso: 'assets/images/wHomemNegro.png'),
  mulherBranca(imageAdressAltura: 'assets/images/hMulherBranca.png', imageAdressPeso: 'assets/images/wMulherBranca.png'),
  mulherNegra(imageAdressAltura: 'assets/images/hMulherNegra.png', imageAdressPeso: 'assets/images/wMulherNegra.png');

  const Estimativas({required this.imageAdressAltura, required this.imageAdressPeso});

  final String imageAdressAltura;
  final String imageAdressPeso;

}
