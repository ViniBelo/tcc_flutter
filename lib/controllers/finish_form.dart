import 'package:estudos_flutter/abstractMaterials/my_finish_button.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/fator_atividade.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:estudos_flutter/models/enums/temperatura_corporal.dart';
import 'package:flutter/material.dart';

import 'altura_estimada.dart';

class FinishForm extends StatelessWidget {
  final bool isEstimativaAlturaChecked;
  final bool isEstimativaPesoChecked;
  final Sexo _selectedValueSexo;
  final Etnia _selectedValueEtnia;
  final int _entradaIdade;
  final TemperaturaCorporal _selectedValueTemperatura;
  final FatorAtividade _selectedValueAtividade;
  final double _entradaInjuria;
  final double _entradaPeso;
  final double _entradaAltura;

  FinishForm({
    required this.isEstimativaAlturaChecked,
    required this.isEstimativaPesoChecked,
    required Sexo selectedValueSexo,
    required Etnia selectedValueEtnia,
    required int entradaIdade,
    required TemperaturaCorporal selectedValueTemperatura,
    required FatorAtividade selectedValueAtividade,
    required double entradaInjuria,
    required double entradaPeso,
    required double entradaAltura,
  })  : _selectedValueSexo = selectedValueSexo,
        _selectedValueEtnia = selectedValueEtnia,
        _entradaIdade = entradaIdade,
        _selectedValueTemperatura = selectedValueTemperatura,
        _selectedValueAtividade = selectedValueAtividade,
        _entradaInjuria = entradaInjuria,
        _entradaPeso = entradaPeso,
        _entradaAltura = entradaAltura;

    

  @override
  Widget build(BuildContext context) {
    return MyFinishFormButton(isEstimativaAlturaChecked: isEstimativaAlturaChecked, isEstimativaPesoChecked: isEstimativaPesoChecked, selectedValueSexo: _selectedValueSexo, selectedValueEtnia: _selectedValueEtnia, entradaIdade: _entradaIdade, selectedValueTemperatura: _selectedValueTemperatura, selectedValueAtividade: _selectedValueAtividade, entradaInjuria: _entradaInjuria, entradaPeso: _entradaPeso, entradaAltura: _entradaAltura);
  }
}