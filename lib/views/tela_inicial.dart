// ignore_for_file: unrelated_type_equality_checks

import 'package:estudos_flutter/abstractMaterials/my_text_field.dart';
import 'package:estudos_flutter/views/tela_final.dart';
import 'package:flutter/services.dart';

import '../abstractMaterials/my_checkbox.dart';
import '../abstractMaterials/my_dropdown_button.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/fator_atividade.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:estudos_flutter/models/enums/temperatura_corporal.dart';
import 'package:flutter/material.dart';

import '../controllers/altura_estimada.dart';
import '../controllers/peso_estimado.dart';

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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Dados do Paciente',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Sexo',
                                  style: TextStyle(fontSize: 18),
                                ),
                                MyDropdownButton(
                                  selectedValue: _selectedValueSexo,
                                  values: Sexo.values,
                                  labels: const [
                                    'Selecione uma opção',
                                    'Homem',
                                    'Mulher'
                                  ],
                                  context: context,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueSexo = value!;
                                    });
                                  },
                                  // ignore: duplicate_ignore
                                  validator: (value) {
                                    if (value == Sexo.nenhum) {
                                      return "Campo obrigatório";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Raça / Etnia',
                                  style: TextStyle(fontSize: 18),
                                ),
                                MyDropdownButton(
                                  selectedValue: _selectedValueEtnia,
                                  values: Etnia.values,
                                  labels: const [
                                    'Selecione uma opção',
                                    'Branco',
                                    'Negro'
                                  ],
                                  context: context,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueEtnia = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == Etnia.nenhum) {
                                      return "Campo obrigatório";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyTextField(
                                  labelText: 'Idade',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {
                                    int? convertedValue = int.tryParse(value);
                                    setState(() {
                                      _entradaIdade = convertedValue ?? 0;
                                    });
                                  },
                                  validator: (entradaIdade) {
                                    if (entradaIdade == '') {
                                      return "Campo Obrigatório";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Estimar peso?',
                                      style: TextStyle(fontSize: 18),
                                    ),
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
                                      MyTextField(
                                        labelText: 'Peso em kg',
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          double? convertedValue =
                                              double.tryParse(value);
                                          setState(() {
                                            _entradaPeso =
                                                convertedValue ?? 0.0;
                                          });
                                        },
                                        validator: (entradaPeso) {
                                          if (entradaPeso == '') {
                                            return "Campo Obrigatório";
                                          }
                                          return null;
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
                                            MyTextField(
                                              labelText:
                                                  'Altura do joelho em cm',
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              onChanged: (value) {
                                                double? convertedValue =
                                                    double.tryParse(value);
                                                setState(() {
                                                  _alturaDeJoelho =
                                                      convertedValue ?? 0.0;
                                                  _entradaPeso = 0.0;
                                                });
                                              },
                                              validator: (alturaDeJoelho) {
                                                if (alturaDeJoelho == '') {
                                                  return "Campo obrigatorio";
                                                }
                                                return null;
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            MyTextField(
                                              labelText:
                                                  'Circunferência do braço em cm',
                                              keyboardType:
                                                  TextInputType.number,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .digitsOnly
                                              ],
                                              onChanged: (value) {
                                                double? convertedValue =
                                                    double.tryParse(value);
                                                setState(() {
                                                  _circunferenciaDoBraco =
                                                      convertedValue ?? 0.0;
                                                  _entradaPeso = 0.0;
                                                });
                                              },
                                              validator:
                                                  (circunferenciaDoBraco) {
                                                if (circunferenciaDoBraco ==
                                                    '') {
                                                  return "Campo Obrigatório";
                                                }
                                                return null;
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Temperatura Corporal',
                                  style: TextStyle(fontSize: 18),
                                ),
                                MyDropdownButton(
                                  selectedValue: _selectedValueTemperatura,
                                  values: TemperaturaCorporal.values,
                                  labels: const [
                                    'Selecione uma opção',
                                    'Sem febre',
                                    '38°C de febre',
                                    '39°C de febre',
                                    '40°C de febre',
                                    '41°C de febre'
                                  ],
                                  context: context,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueTemperatura = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == TemperaturaCorporal.nenhum) {
                                      return "Campo obrigatório";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Fator Atividade',
                                  style: TextStyle(fontSize: 18),
                                ),
                                MyDropdownButton(
                                  selectedValue: _selectedValueAtividade,
                                  values: FatorAtividade.values,
                                  labels: const [
                                    'Selecione uma opção',
                                    'Confinado ao leito',
                                    'Acamado, porém móvel',
                                    'Paciente que deambula'
                                  ],
                                  context: context,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedValueAtividade = value!;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == FatorAtividade.nenhum) {
                                      return "Campo obrigatório";
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                            Column(
                              children: [
                                MyTextField(
                                  labelText: 'Fator injúria',
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  onChanged: (value) {
                                    double? convertedValue =
                                        double.tryParse(value);
                                    setState(() {
                                      _entradaInjuria = convertedValue ?? 0.0;
                                    });
                                  },
                                  validator: (circunferenciaDoBraco) {
                                    if (circunferenciaDoBraco == '') {
                                      return "Campo Obrigatório";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Estimar altura?',
                                      style: TextStyle(fontSize: 18),
                                    ),
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
                                      MyTextField(
                                        labelText: 'Altura em cm',
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          double? convertedValue =
                                              double.tryParse(value);
                                          setState(() {
                                            _entradaAltura =
                                                convertedValue ?? 0.0;
                                            _alturaDeJoelho = 0.0;
                                          });
                                        },
                                        validator: (alturaDeJoelho) {
                                          if (alturaDeJoelho == '') {
                                            return "Campo Obrigatório";
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                if (isEstimativaAlturaChecked)
                                  Column(
                                    children: [
                                      MyTextField(
                                        labelText: 'Altura do joelho em cm',
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        onChanged: (value) {
                                          double? convertedValue =
                                              double.tryParse(value);
                                          setState(() {
                                            _alturaDeJoelho =
                                                convertedValue ?? 0.0;
                                            _entradaAltura = 0.0;
                                          });
                                        },
                                        validator: (alturaDeJoelho) {
                                          if (alturaDeJoelho == '') {
                                            return "Campo Obrigatório";
                                          }
                                          return null;
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
                  style: OutlinedButton.styleFrom(
                      minimumSize: const Size(200, 50)),
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
                    if (_formKey.currentState!.validate()) {
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
                    } else {}
                  },
                  child: const Text(
                    "Finalizar",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate() {
    _formKey.currentState!.validate();
  }
}
