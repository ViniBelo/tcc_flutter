import 'package:estudos_flutter/models/enums/estimativas.dart';

import '../models/enums/etnia.dart';
import '../models/enums/sexo.dart';

// ignore: non_constant_identifier_names
String estimativas_utilizadas(Sexo sexo, Etnia etnia) {
  switch (sexo) {
    case Sexo.masculino:
      switch (etnia) {
        case Etnia.branco:
          return Estimativas.homemBranco.imageAdress;
        case Etnia.negro:
          return Estimativas.homemNegro.imageAdress;
        default:
          return '';
      }
    case Sexo.feminino:
      switch (etnia) {
        case Etnia.branco:
          return Estimativas.mulherBranca.imageAdress;
        case Etnia.negro:
          return Estimativas.mulherNegra.imageAdress;
        default:
          return '';
      }
    default:
      return '';
  }
}
