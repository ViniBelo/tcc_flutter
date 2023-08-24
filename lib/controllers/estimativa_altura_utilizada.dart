import 'package:estudos_flutter/models/enums/estimativas.dart';

import '../models/enums/etnia.dart';
import '../models/enums/sexo.dart';

// ignore: non_constant_identifier_names
String estimativa_altura_utilizada(Sexo sexo, Etnia etnia) {
  switch (sexo) {
    case Sexo.masculino:
      switch (etnia) {
        case Etnia.branco:
          return Estimativas.homemBranco.imageAdressAltura;
        case Etnia.negro:
          return Estimativas.homemNegro.imageAdressAltura;
        default:
          return '';
      }
    case Sexo.feminino:
      switch (etnia) {
        case Etnia.branco:
          return Estimativas.mulherBranca.imageAdressAltura;
        case Etnia.negro:
          return Estimativas.mulherNegra.imageAdressAltura;
        default:
          return '';
      }
    default:
      return '';
  }
}
