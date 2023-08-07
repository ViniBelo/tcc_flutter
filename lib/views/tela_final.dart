import 'package:flutter/material.dart';

import '../models/enums/etnia.dart';
import '../models/enums/fator_atividade.dart';
import '../models/enums/sexo.dart';
import '../models/enums/temperatura_corporal.dart';

class ResultadoTela extends StatelessWidget {
  final Sexo sexo;
  final Etnia etnia;
  final String idade;
  final String peso;
  final TemperaturaCorporal temperatura;
  final FatorAtividade atividade;
  final String injuria;
  final String altura;

  ResultadoTela({
    required this.sexo,
    required this.etnia,
    required this.idade,
    required this.peso,
    required this.temperatura,
    required this.atividade,
    required this.injuria,
    required this.altura,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Sexo: ${sexo.toString()}'),
            Text('Raça / Etnia: ${etnia.toString()}'),
            Text('Idade: $idade'),
            Text('Peso: $peso'),
            Text('Temperatura Corporal: ${temperatura.toString()}'),
            Text('Fator Atividade: ${atividade.toString()}'),
            Text('Fator Injúria: $injuria'),
            Text('Altura: $altura'),
          ],
        ),
      ),
    );
  }
}
