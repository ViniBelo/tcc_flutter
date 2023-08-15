import 'package:estudos_flutter/controllers/peso_estimado.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';

// ignore: non_constant_identifier_names
double estima_peso(Sexo selectedValueSexo, Etnia selectedValueEtnia, double peso, double alturaDeJoelho, double circunferenciaDoBraco, bool isEstimativaPesoChecked) {
    if (isEstimativaPesoChecked) {
      return peso_estimado(
          selectedValueSexo,
          selectedValueEtnia,
          alturaDeJoelho,
          circunferenciaDoBraco);
    }
    else return peso;
}