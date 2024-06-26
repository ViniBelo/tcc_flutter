import '../models/enums/sexo.dart';
import '../models/formules/taxa_metabolica_basal.dart';

// ignore: non_constant_identifier_names
double formula_tmb(Sexo sexo, double peso, double altura, int idade) {
  switch (sexo) {
    case Sexo.masculino:
      return homem_tmb(peso, altura, idade);
    case Sexo.feminino:
      return mulher_tmb(peso, altura, idade);
    default:
      return 0;
  }
}
