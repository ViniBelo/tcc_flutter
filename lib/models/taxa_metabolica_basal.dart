import 'package:estudos_flutter/models/enums/sexo.dart';

double HomemTMB(double peso, double altura, int idade) {
  return 66.0 + (13.7 * peso) + (5.0 * altura) + (6.8 * idade);
}

double MulherTMB(double peso, double altura, int idade) {
  return 65.5 + (9.6 * peso) + (1.8 * altura) + (4.7 * idade);
}

double TMB(Sexo sexo, double peso, double altura, int idade) {
  switch(sexo) {
    case Sexo.homem:
      return HomemTMB(peso, altura, idade);
    case Sexo.mulher:
      return MulherTMB(peso, altura, idade);
    default:
      return 0;
  }
}