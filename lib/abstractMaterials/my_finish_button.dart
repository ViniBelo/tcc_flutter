import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/fator_atividade.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:estudos_flutter/models/enums/temperatura_corporal.dart';
import 'package:flutter/material.dart';

import '../views/tela_final.dart';

class MyFinishFormButton extends StatelessWidget {
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

  MyFinishFormButton({
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
    return FilledButton(
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      onPressed: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return ResultadoTela(
              sexo: _selectedValueSexo,
              etnia: _selectedValueEtnia,
              idade: _entradaIdade,
              peso: _entradaPeso,
              fatorTermico: _selectedValueTemperatura,
              fatorAtividade: _selectedValueAtividade,
              fatorInjuria: _entradaInjuria,
              altura: _entradaAltura,
            );
          }),
        );
      },
      child: const Text(
        "Finalizar",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
