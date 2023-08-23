import 'package:estudos_flutter/controllers/estima_peso.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';

// ignore: non_constant_identifier_names
double valida_peso(
    Sexo selectedValueSexo,
    Etnia selectedValueEtnia,
    double peso,
    double alturaDoJoelho,
    double circunferenciaDoBraco,
    bool isEstimativaPesoChecked) {
  if (isEstimativaPesoChecked) {
    return estima_peso(selectedValueSexo, selectedValueEtnia, peso,
        alturaDoJoelho, circunferenciaDoBraco, isEstimativaPesoChecked);
  } else {
    return peso;
  }
}
