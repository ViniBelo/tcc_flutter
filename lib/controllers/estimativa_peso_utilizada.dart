// ignore: non_constant_identifier_names
import '../models/enums/estimativas.dart';
import '../models/enums/etnia.dart';
import '../models/enums/sexo.dart';

// ignore: non_constant_identifier_names
String estimativa_peso_utilizada(Sexo sexo, Etnia etnia) {
  switch (sexo) {
    case Sexo.masculino:
      switch (etnia) {
        case Etnia.branco:
          return Estimativas.homemBranco.imageAdressPeso;
        case Etnia.negro:
          return Estimativas.homemNegro.imageAdressPeso;
        default:
          return '';
      }
    case Sexo.feminino:
      switch (etnia) {
        case Etnia.branco:
          return Estimativas.mulherBranca.imageAdressPeso;
        case Etnia.negro:
          return Estimativas.mulherNegra.imageAdressPeso;
        default:
          return '';
      }
    default:
      return '';
  }
}
