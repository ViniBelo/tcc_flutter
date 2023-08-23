import 'package:estudos_flutter/controllers/altura_estimada.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';

// ignore: non_constant_identifier_names
double valida_altura(
    Sexo selectedValueSexo,
    Etnia selectedValueEtnia,
    double altura,
    double alturaDoJoelho,
    int idade,
    bool isEstimativaAlturaChecked) {
  if (isEstimativaAlturaChecked) {
    return altura_estimada(
        selectedValueSexo, selectedValueEtnia, alturaDoJoelho, idade);
  } else {
    return altura;
  }
}
