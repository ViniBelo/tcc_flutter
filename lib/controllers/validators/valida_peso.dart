import 'package:estudos_flutter/controllers/estima_peso.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
double valida_peso(
    Sexo selectedValueSexo,
    Etnia selectedValueEtnia,
    TextEditingController peso,
    TextEditingController alturaDoJoelho,
    TextEditingController circunferenciaDoBraco,
    bool isEstimativaPesoChecked) {
  if (isEstimativaPesoChecked) {
    double alturaDoJoelhoFinal, circunferenciaDoBracoFinal;
    alturaDoJoelhoFinal = double.parse(alturaDoJoelho.text);
    circunferenciaDoBracoFinal = double.parse(circunferenciaDoBraco.text);
    return estima_peso(selectedValueSexo, selectedValueEtnia, peso,
        alturaDoJoelhoFinal, circunferenciaDoBracoFinal, isEstimativaPesoChecked);
  } else {
    double pesoFinal = double.parse(peso.text);
    return pesoFinal;
  }
}
