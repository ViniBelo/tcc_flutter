import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/formules/estimatives/altura_estimada.dart';

import '../models/enums/sexo.dart';

// ignore: non_constant_identifier_names
double altura_estimada(
    Sexo sexo, Etnia etnia, double alturaDeJoelho, int idade) {
  switch (sexo) {
    case Sexo.masculino:
      switch (etnia) {
        case Etnia.branco:
          return altura_homem_branco(alturaDeJoelho);
        case Etnia.negro:
          return altura_homem_negro(alturaDeJoelho);
        default:
          return 0;
      }
    case Sexo.feminino:
      switch (etnia) {
        case Etnia.branco:
          return altura_mulher_branca(alturaDeJoelho, idade);
        case Etnia.negro:
          return altura_mulher_negra(alturaDeJoelho, idade);
        default:
          return 0;
      }
    default:
      return 0;
  }
}
