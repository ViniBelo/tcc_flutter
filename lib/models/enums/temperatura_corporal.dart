enum TemperaturaCorporal {
  nenhum(fatorTermico: 0),
  semFebre(fatorTermico: 1.0),
  trintaEOito(fatorTermico: 1.1),
  trintaENove(fatorTermico: 1.2),
  quarenta(fatorTermico: 1.3),
  quarentaEUm(fatorTermico: 1.4);

  const TemperaturaCorporal({required this.fatorTermico});

  final double fatorTermico;
}
