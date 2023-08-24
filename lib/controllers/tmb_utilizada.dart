import 'package:estudos_flutter/models/enums/sexo.dart';

// ignore: non_constant_identifier_names
String tmb_utilizada (Sexo sexo) {
  switch (sexo) {
    case Sexo.masculino:
      return 'assets/images/tmbHomem.png';
    case Sexo.feminino:
      return 'assets/images/tmbMulher.png';
    default:
      return '';
  }
}