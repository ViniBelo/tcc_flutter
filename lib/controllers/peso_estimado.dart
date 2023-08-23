import '../models/enums/etnia.dart';
import '../models/enums/sexo.dart';
import '../models/formules/estimatives/peso_estimado.dart';

// ignore: non_constant_identifier_names
double peso_estimado(Sexo sexo, Etnia etnia, double alturaDoJoelho,
    double circunferenciaDoBraco) {
  switch (sexo) {
    case Sexo.masculino:
      switch (etnia) {
        case Etnia.branco:
          return peso_homem_branco(alturaDoJoelho, circunferenciaDoBraco);
        case Etnia.negro:
          return peso_homem_negro(alturaDoJoelho, circunferenciaDoBraco);
        default:
          return 0;
      }
    case Sexo.feminino:
      switch (etnia) {
        case Etnia.branco:
          return peso_homem_branco(alturaDoJoelho, circunferenciaDoBraco);
        case Etnia.negro:
          return peso_homem_negro(alturaDoJoelho, circunferenciaDoBraco);
        default:
          return 0;
      }
    default:
      return 0;
  }
}
