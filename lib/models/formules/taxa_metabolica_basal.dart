import 'package:estudos_flutter/models/enums/sexo.dart';

double homem_tmb(double peso, double altura, int idade) {
  return 66.0 + (13.7 * peso) + (5.0 * altura) + (6.8 * idade);
}

double mulher_tmb(double peso, double altura, int idade) {
  return 65.5 + (9.6 * peso) + (1.8 * altura) + (4.7 * idade);
}
