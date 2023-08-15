enum TemperaturaCorporal {
  nenhum(fatorTermico: 0, temperatura: ''),
  semFebre(fatorTermico: 1.0, temperatura: 'Sem febre'),
  trintaEOito(fatorTermico: 1.1, temperatura: '38°C de febre'),
  trintaENove(fatorTermico: 1.2, temperatura: '39°C de febre'),
  quarenta(fatorTermico: 1.3, temperatura: '40°C de febre'),
  quarentaEUm(fatorTermico: 1.4, temperatura: '41°C de febre');

  const TemperaturaCorporal(
      {required this.fatorTermico, required this.temperatura});

  final double fatorTermico;
  final String temperatura;
}
