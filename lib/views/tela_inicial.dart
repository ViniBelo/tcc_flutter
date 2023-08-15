import 'package:estudos_flutter/controllers/altura_estimada.dart';
import 'package:estudos_flutter/controllers/peso_estimado.dart';
import 'package:flutter/services.dart';

import '../abstractMaterials/my_checkbox.dart';
import '../abstractMaterials/my_dropdown_button.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/fator_atividade.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:estudos_flutter/models/enums/temperatura_corporal.dart';
import 'package:estudos_flutter/views/tela_final.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  Sexo _selectedValueSexo = Sexo.nenhum;
  Etnia _selectedValueEtnia = Etnia.nenhum;
  TemperaturaCorporal _selectedValueTemperatura = TemperaturaCorporal.nenhum;
  FatorAtividade _selectedValueAtividade = FatorAtividade.nenhum;
  int _entradaIdade = 0;
  double _entradaInjuria = 0.0;
  double _entradaPeso = 0.0;
  double _entradaAltura = 0.0;
  double _alturaDeJoelho = 0.0;
  double _circunferenciaDoBraco = 0.0;

  bool isEstimativaPesoChecked = false;
  bool isEstimativaAlturaChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dados do Paciente'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Sexo'),
                              MyDropdownButton<Sexo>(
                                _selectedValueSexo,
                                Sexo.values,
                                ['Selecione uma opção', 'Homem', 'Mulher'],
                                (newValue) {
                                  setState(() {
                                    _selectedValueSexo = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Raça / Etnia'),
                              MyDropdownButton<Etnia>(
                                _selectedValueEtnia,
                                Etnia.values,
                                ['Selecione uma opção', 'Branco', 'Negro'],
                                (newValue) {
                                  setState(() {
                                    _selectedValueEtnia = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Idade'),
                              TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  int? convertedValue = int.tryParse(value);
                                  setState(() {
                                    _entradaIdade = convertedValue ?? 0;
                                  });
                                },
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Estimar peso?'),
                                  MyCheckBox(
                                    onChanged: (value) {
                                      setState(() {
                                        isEstimativaPesoChecked = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              if (!isEstimativaPesoChecked)
                                Column(
                                  children: [
                                    Text('Peso em kg'),
                                    TextFormField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        double? convertedValue =
                                            double.tryParse(value);
                                        setState(() {
                                          _entradaPeso = convertedValue ?? 0.0;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              if (isEstimativaPesoChecked)
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('Altura do joelho em cm'),
                                          TextFormField(
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              double? convertedValue =
                                                  double.tryParse(value);
                                              setState(() {
                                                _alturaDeJoelho =
                                                    convertedValue ?? 0.0;
                                                _entradaPeso = 0.0;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text('Circunferência do braço em cm'),
                                          TextFormField(
                                            textAlign: TextAlign.center,
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              double? convertedValue =
                                                  double.tryParse(value);
                                              setState(() {
                                                _circunferenciaDoBraco =
                                                    convertedValue ?? 0.0;
                                                _entradaPeso = 0.0;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text('Temperatura Corporal'),
                              MyDropdownButton<TemperaturaCorporal>(
                                _selectedValueTemperatura,
                                TemperaturaCorporal.values,
                                [
                                  'Selecione uma opção',
                                  'Sem febre',
                                  '38°C de febre',
                                  '39°C de febre',
                                  '40°C de febre',
                                  '41°C de febre'
                                ],
                                (newValue) {
                                  setState(() {
                                    _selectedValueTemperatura = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Fator Atividade'),
                              MyDropdownButton<FatorAtividade>(
                                _selectedValueAtividade,
                                FatorAtividade.values,
                                [
                                  'Selecione uma opção',
                                  'Confinado ao leito',
                                  'Acamado, porém móvel',
                                  'Paciente que deambula'
                                ],
                                (newValue) {
                                  setState(() {
                                    _selectedValueAtividade = newValue!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text('Fator injúria'),
                              TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  double? convertedValue =
                                      double.tryParse(value);
                                  setState(() {
                                    _entradaInjuria = convertedValue ?? 0.0;
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Estimar altura?'),
                                  MyCheckBox(
                                    onChanged: (value) {
                                      setState(() {
                                        isEstimativaAlturaChecked = value!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              if (!isEstimativaAlturaChecked)
                                Column(
                                  children: [
                                    Text('Altura em cm'),
                                    TextFormField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        double? convertedValue =
                                            double.tryParse(value);
                                        setState(() {
                                          _entradaAltura =
                                              convertedValue ?? 0.0;
                                          _alturaDeJoelho = 0.0;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              if (isEstimativaAlturaChecked)
                                Column(
                                  children: [
                                    Text('Altura do joelho em cm'),
                                    TextField(
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        double? convertedValue =
                                            double.tryParse(value);
                                        setState(() {
                                          _alturaDeJoelho =
                                              convertedValue ?? 0.0;
                                          _entradaAltura = 0.0;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              FilledButton(
                style:
                    OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
                onPressed: () {
                  if (isEstimativaAlturaChecked) {
                    _entradaAltura = altura_estimada(_selectedValueSexo,
                        _selectedValueEtnia, _alturaDeJoelho, _entradaIdade);
                  }
                  if (isEstimativaPesoChecked) {
                    _entradaPeso = peso_estimado(
                        _selectedValueSexo,
                        _selectedValueEtnia,
                        _alturaDeJoelho,
                        _circunferenciaDoBraco);
                  }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
