import 'package:estudos_flutter/controllers/estimativa_utilizada.dart';
import 'package:estudos_flutter/controllers/validators/valida_altura.dart';
import 'package:estudos_flutter/controllers/validators/valida_peso.dart';
import 'package:estudos_flutter/views/abstractMaterials/my_back_button.dart';
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
  final double alturaDoJoelho;
  final double circunferenciaDoBraco;
  final bool isEstimativaAlturaChecked;
  final bool isEstimativaPesoChecked;

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
    required this.alturaDoJoelho,
    required this.circunferenciaDoBraco,
    required this.isEstimativaAlturaChecked,
    required this.isEstimativaPesoChecked,
  }) : super(key: key);

  double get tmb => formula_tmb(sexo, peso, altura, idade);
  double get get =>
      formula_get(tmb, fatorAtividade, fatorInjuria, fatorTermico);
  String get estimativaUtilizada => estimativas_utilizadas(sexo, etnia);
  double get pesoFinal => valida_peso(sexo, etnia, peso, alturaDoJoelho,
      circunferenciaDoBraco, isEstimativaPesoChecked);
  double get alturaFinal => valida_altura(
      sexo, etnia, altura, alturaDoJoelho, idade, isEstimativaAlturaChecked);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Resultado'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Valores inseridos:',
                style: TextStyle(fontSize: 35),
              ),
            ),
            OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if (orientation == Orientation.landscape) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Sexo: ${sexo.sexo}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Idade: ${idade.toString()}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Peso: ${pesoFinal.toStringAsFixed(2)} kg',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          if (isEstimativaPesoChecked)
                            Text(
                              'Circunferência do braço: ${circunferenciaDoBraco.toStringAsFixed(2)}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                          Text(
                            'Temperatura Corporal: ${fatorTermico.temperatura}, valor: ${fatorTermico.fatorTermico}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'TMB: ${tmb.toStringAsFixed(2)}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Fator Injúria: ${fatorInjuria.toString()}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Raça / Etnia: ${etnia.etnia}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Altura: ${alturaFinal.toStringAsFixed(0)} cm',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          if (isEstimativaAlturaChecked ||
                              isEstimativaPesoChecked)
                            Text(
                              'Altura do joelho: ${alturaDoJoelho.toStringAsFixed(2)}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                          Text(
                            'Fator Atividade: ${fatorAtividade.atividade}, valor: ${fatorAtividade.fatorAtividade}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'GET: ${get.toStringAsFixed(2)}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Sexo: ${sexo.sexo}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Idade: ${idade.toString()}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Peso: ${pesoFinal.toStringAsFixed(2)} kg',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          if (isEstimativaPesoChecked)
                            Text(
                              'Circunferência do braço: ${circunferenciaDoBraco.toStringAsFixed(2)}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                          Text(
                            'Temperatura Corporal: ${fatorTermico.temperatura}, valor: ${fatorTermico.fatorTermico}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'TMB: ${tmb.toStringAsFixed(2)}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Fator Injúria: ${fatorInjuria.toString()}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Raça / Etnia: ${etnia.etnia}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Altura: ${alturaFinal.toStringAsFixed(0)} cm',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          if (isEstimativaAlturaChecked ||
                              isEstimativaPesoChecked)
                            Text(
                              'Altura do joelho: ${alturaDoJoelho.toStringAsFixed(2)}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                          Text(
                            'Fator Atividade: ${fatorAtividade.atividade}, valor: ${fatorAtividade.fatorAtividade}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'GET: ${get.toStringAsFixed(2)}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    'Fórmulas utilizadas:',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Taxa metabólica basal:',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/images/tmb.png'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Gasto energético total:',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/get.png',
                        scale: 0.7,
                      ),
                    ),
                  ],
                ),
                if (isEstimativaAlturaChecked || isEstimativaPesoChecked)
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Altura estimada:',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                if (isEstimativaAlturaChecked || isEstimativaPesoChecked)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      estimativaUtilizada,
                      scale: 0.7,
                    ),
                  ),
                if (isEstimativaPesoChecked)
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Peso estimada:',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                if (isEstimativaPesoChecked)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      estimativaUtilizada,
                      scale: 0.7,
                    ),
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
