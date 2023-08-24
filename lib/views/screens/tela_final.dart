import 'package:estudos_flutter/controllers/estimativa_altura_utilizada.dart';
import 'package:estudos_flutter/controllers/estimativa_peso_utilizada.dart';
import 'package:estudos_flutter/controllers/tmb_utilizada.dart';
import 'package:estudos_flutter/controllers/validators/valida_altura.dart';
import 'package:estudos_flutter/controllers/validators/valida_peso.dart';
import 'package:estudos_flutter/views/abstractMaterials/my_back_button.dart';
import 'package:estudos_flutter/controllers/taxa_metabolica_basal.dart';
import 'package:estudos_flutter/models/formules/formula_get.dart';
import 'package:flutter/material.dart';

import '../../controllers/altura_do_joelho.dart';
import '../../controllers/circunferencia_do_braco.dart';
import '../../models/enums/etnia.dart';
import '../../models/enums/fator_atividade.dart';
import '../../models/enums/sexo.dart';
import '../../models/enums/temperatura_corporal.dart';

class ResultadoTela extends StatefulWidget {
  final Sexo sexo;
  final Etnia etnia;
  final int idade;
  final TextEditingController peso;
  final TextEditingController altura;
  final TextEditingController alturaDoJoelho;
  final TextEditingController circunferenciaDoBraco;
  final TemperaturaCorporal fatorTermico;
  final FatorAtividade fatorAtividade;
  final double fatorInjuria;
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

  @override
  // ignore: library_private_types_in_public_api
  _ResultadoTelaState createState() => _ResultadoTelaState();
}

class _ResultadoTelaState extends State<ResultadoTela> {
  double get pesoFinal => valida_peso(
      widget.sexo,
      widget.etnia,
      widget.peso,
      widget.alturaDoJoelho,
      widget.circunferenciaDoBraco,
      widget.isEstimativaPesoChecked);
  double get alturaFinal => valida_altura(
      widget.sexo,
      widget.etnia,
      widget.altura,
      widget.alturaDoJoelho,
      widget.idade,
      widget.isEstimativaAlturaChecked);
  double get tmb =>
      formula_tmb(widget.sexo, pesoFinal, alturaFinal, widget.idade);
  double get get => formula_get(
      tmb, widget.fatorAtividade, widget.fatorInjuria, widget.fatorTermico);
  double get alturaDoJoelhoFinal => altura_do_joelho(widget.alturaDoJoelho,
      widget.isEstimativaAlturaChecked, widget.isEstimativaPesoChecked);
  double get circunferenciaDoBracoFinal => circunferencia_do_braco(
      widget.circunferenciaDoBraco, widget.isEstimativaPesoChecked);
  String get tmbUtilizada => tmb_utilizada(widget.sexo);
  String get estimativaAlturaUtilizada =>
      estimativa_altura_utilizada(widget.sexo, widget.etnia);
  String get estimativaPesoUtilizada =>
      estimativa_peso_utilizada(widget.sexo, widget.etnia);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        surfaceTintColor: Colors.green,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Resultado'),
      ),
      body: Container(
            height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFEAFCE0), // Um tom de verde pastel muito claro
              Color(0xFFF1FFD6), // Um tom de verde pastel mais escuro
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
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
                              'Sexo: ${widget.sexo.sexo}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                            Text(
                              'Idade: ${widget.idade.toString()}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                            Text(
                              'Peso: ${pesoFinal.toStringAsFixed(2)} kg',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                            if (widget.isEstimativaPesoChecked)
                              Text(
                                'Circunferência do braço: ${circunferenciaDoBracoFinal.toStringAsFixed(2)} cm',
                                style: (const TextStyle(fontSize: 30)),
                              ),
                            Text(
                              'Temperatura Corporal: ${widget.fatorTermico.temperatura}, valor: ${widget.fatorTermico.fatorTermico}',
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
                              'Fator Injúria: ${widget.fatorInjuria.toString()}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                            Text(
                              'Raça / Etnia: ${widget.etnia.etnia}',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                            Text(
                              'Altura: ${alturaFinal.toStringAsFixed(0)} cm',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                            if (widget.isEstimativaAlturaChecked ||
                                widget.isEstimativaPesoChecked)
                              Text(
                                'Altura do joelho: ${alturaDoJoelhoFinal.toStringAsFixed(2)} cm',
                                style: (const TextStyle(fontSize: 30)),
                              ),
                            Text(
                              'Fator Atividade: ${widget.fatorAtividade.atividade}, valor: ${widget.fatorAtividade.fatorAtividade}',
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
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'Sexo: ${widget.sexo.sexo}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Idade: ${widget.idade.toString()}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Peso: ${pesoFinal.toStringAsFixed(2)} kg',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          if (widget.isEstimativaPesoChecked)
                            Text(
                              'Circunferência do braço: ${circunferenciaDoBracoFinal.toStringAsFixed(2)} cm',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                          Text(
                            'Altura: ${alturaFinal.toStringAsFixed(0)} cm',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          if (widget.isEstimativaAlturaChecked ||
                              widget.isEstimativaPesoChecked)
                            Text(
                              'Altura do joelho: ${alturaDoJoelhoFinal.toStringAsFixed(2)} cm',
                              style: (const TextStyle(fontSize: 30)),
                            ),
                          Text(
                            'Fator Injúria: ${widget.fatorInjuria.toString()}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Raça / Etnia: ${widget.etnia.etnia}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Temperatura Corporal: ${widget.fatorTermico.temperatura}, valor: ${widget.fatorTermico.fatorTermico}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'Fator Atividade: ${widget.fatorAtividade.atividade}, valor: ${widget.fatorAtividade.fatorAtividade}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'TMB: ${tmb.toStringAsFixed(2)}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                          Text(
                            'GET: ${get.toStringAsFixed(2)}',
                            style: (const TextStyle(fontSize: 30)),
                          ),
                        ],
                      ),
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
                        child: Image.asset(
                          tmbUtilizada,
                          scale: 0.5,
                        ),
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
                  if (widget.isEstimativaAlturaChecked ||
                      widget.isEstimativaPesoChecked)
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Altura estimada:',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  if (widget.isEstimativaAlturaChecked ||
                      widget.isEstimativaPesoChecked)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        estimativaAlturaUtilizada,
                        scale: 0.5,
                      ),
                    ),
                  if (widget.isEstimativaPesoChecked)
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        'Peso estimado:',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  if (widget.isEstimativaPesoChecked)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        estimativaPesoUtilizada,
                        scale: 0.5,
                      ),
                    ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 70),
                child: MyFilledButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
