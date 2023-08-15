import 'package:estudos_flutter/models/enums/fator_atividade.dart';
import 'package:estudos_flutter/models/enums/temperatura_corporal.dart';

double formula_get(double tmb, FatorAtividade fatorAtividade,
    double fatorInjuria, TemperaturaCorporal fatorTermico) {
  return tmb *
      fatorAtividade.fatorAtividade *
      fatorInjuria *
      fatorTermico.fatorTermico;
}
