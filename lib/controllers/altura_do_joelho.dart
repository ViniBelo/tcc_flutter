import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
double altura_do_joelho(TextEditingController alturaDoJoelho, bool isEstimativaAlturaChecked, bool isEstimativaPesoChecked) {
  if (isEstimativaAlturaChecked || isEstimativaPesoChecked) {
    double alturaDoJoelhoFinal = double.parse(alturaDoJoelho.text);
    return alturaDoJoelhoFinal;
  } else {
    return 0.0;
  }
}