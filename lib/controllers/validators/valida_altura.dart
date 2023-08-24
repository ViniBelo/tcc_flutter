import 'package:estudos_flutter/controllers/altura_estimada.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
double valida_altura(
    Sexo selectedValueSexo,
    Etnia selectedValueEtnia,
    TextEditingController altura,
    TextEditingController alturaDoJoelho,
    int idade,
    bool isEstimativaAlturaChecked) {
  if (isEstimativaAlturaChecked) {
    double alturaDoJoelhoFinal = double.parse(alturaDoJoelho.text);
    return altura_estimada(
        selectedValueSexo, selectedValueEtnia, alturaDoJoelhoFinal, idade);
  } else {
    double alturaFinal = double.parse(altura.text);
    return alturaFinal;
  }
}
