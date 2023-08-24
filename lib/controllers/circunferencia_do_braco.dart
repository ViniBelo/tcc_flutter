import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
double circunferencia_do_braco(TextEditingController circunferenciaDoBraco, bool isEstimativaPesoChecked) {
  if (isEstimativaPesoChecked) {
    double circunferenciaDoBracoFinal = double.parse(circunferenciaDoBraco.text);
    return circunferenciaDoBracoFinal;
  } else {
    return 0.0;
  }
}