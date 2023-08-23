import 'package:estudos_flutter/abstractMaterials/my_back_button.dart';
import 'package:estudos_flutter/controllers/taxa_metabolica_basal.dart';
import 'package:estudos_flutter/models/formules/formula_get.dart';
import 'package:flutter/material.dart';

import '../models/enums/etnia.dart';
import '../models/enums/fator_atividade.dart';
import '../models/enums/sexo.dart';
import '../models/enums/temperatura_corporal.dart';

class ResultadoTela extends StatelessWidget {
  final Sexo sexo;
  final Etnia etnia;
  final int idade;
  final double peso;
  final TemperaturaCorporal fatorTermico;
  final FatorAtividade fatorAtividade;
  final double fatorInjuria;
  final double altura;

  const ResultadoTela({
    Key? key,
    required this.sexo,
    required this.etnia,
    required this.idade,
    required this.peso,
    required this.fatorTermico,
    required this.fatorAtividade,
    required this.fatorInjuria,
    required this.altura,
  }) : super(key: key);

  double get tmb => formula_tmb(sexo, peso, altura, idade);
  double get get =>
      formula_get(tmb, fatorAtividade, fatorInjuria, fatorTermico);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Sexo: ${sexo.sexo}', style: (TextStyle(fontSize: 30)),),
                    Text('Raça / Etnia: ${etnia.etnia}', style: (TextStyle(fontSize: 30)),),
                    Text('Idade: ${idade.toString()}', style: (TextStyle(fontSize: 30)),),
                    Text('Peso: ${peso.toStringAsFixed(2)} kg', style: (TextStyle(fontSize: 30)),),
                    Text(
                        'Temperatura Corporal: ${fatorTermico.temperatura}, valor: ${fatorTermico.fatorTermico}', style: (TextStyle(fontSize: 30)),),
                  ],
                ),
                Column(
              children: [
                Text('Fator Injúria: ${fatorInjuria.toString()}', style: (TextStyle(fontSize: 30)),),
                Text('Altura: ${altura.toStringAsFixed(0)} cm', style: (TextStyle(fontSize: 30)),),
                Text('TMB: ${tmb.toStringAsFixed(2)}', style: (TextStyle(fontSize: 30)),),
                Text('GET: ${get.toStringAsFixed(2)}', style: (TextStyle(fontSize: 30)),),
                Text(
                    'Fator Atividade: ${fatorAtividade.atividade}, valor: ${fatorAtividade.fatorAtividade}', style: (TextStyle(fontSize: 30)),),
              ],
            ),
              ],
            ),
            
            const MyFilledButton(),
          ],
        ),
      ),
    );
  }
}
