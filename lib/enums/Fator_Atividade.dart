enum FatorAtividade {
  confinadoAoLeito(fatorAtividade: 1.2),
  acamadoPoremMovel(fatorAtividade: 1.25),
  deambula(fatorAtividade: 1.3);

  const FatorAtividade({required this.fatorAtividade});

  final double fatorAtividade;
}
