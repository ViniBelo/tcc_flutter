enum FatorAtividade {
  nenhum(fatorAtividade: 0, atividade: ''),
  confinadoAoLeito(
      fatorAtividade: 1.2, atividade: 'Paciente confinado ao leito'),
  acamadoPoremMovel(
      fatorAtividade: 1.25, atividade: 'Paciente acamado, porém móvel'),
  deambula(fatorAtividade: 1.3, atividade: 'Paciente deambula');

  const FatorAtividade({required this.fatorAtividade, required this.atividade});

  final double fatorAtividade;
  final String atividade;
}
