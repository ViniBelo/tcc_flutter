// ignore_for_file: unrelated_type_equality_checks
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:estudos_flutter/views/abstractMaterials/my_text_field.dart';
import 'package:estudos_flutter/views/screens/tela_final.dart';

import '../abstractMaterials/my_checkbox.dart';
import '../abstractMaterials/my_dropdown_button.dart';
import 'package:estudos_flutter/models/enums/etnia.dart';
import 'package:estudos_flutter/models/enums/fator_atividade.dart';
import 'package:estudos_flutter/models/enums/sexo.dart';
import 'package:estudos_flutter/models/enums/temperatura_corporal.dart';
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
  TextEditingController idadeInputController = TextEditingController();
  TextEditingController pesoInputController = TextEditingController();
  TextEditingController alturaJoelhoInputController = TextEditingController();
  TextEditingController circunferenciaBracoInputController =
      TextEditingController();
  TextEditingController fatorInjuriaInputController = TextEditingController();
  TextEditingController alturaInputController = TextEditingController();
  TextEditingController sexoInputController = TextEditingController();
  TextEditingController etniaInputController = TextEditingController();
  TextEditingController temperaturaInputController = TextEditingController();
  TextEditingController atividadeInputController = TextEditingController();

  bool isEstimativaPesoChecked = false;
  bool isEstimativaAlturaChecked = false;

  var maskFatorInjuriaFormatter = MaskTextInputFormatter(
      mask: '#.##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskPesoFormatter = MaskTextInputFormatter(
      mask: '###.##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskAlturaFormatter = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskAlturaDoJoelhoFormatter = MaskTextInputFormatter(
      mask: '##.##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var maskIdadeFormatter = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        surfaceTintColor: Colors.green,
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Dados do Paciente',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Sexo',
                                  style: TextStyle(fontSize: 16),
                                ),
                                MyDropdownButton(
                                  controller: sexoInputController,
                                  selectedValue: _selectedValueSexo,
                                  values: Sexo.values,
                                  labels: const [
                                    'Selecione uma opção',
                                    'Masculino',
                                    'Feminino'
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
                                  style: TextStyle(fontSize: 16),
                                ),
                                MyDropdownButton(
                                  controller: etniaInputController,
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
                                  maskTextInputFormatter: maskIdadeFormatter,
                                  controller: idadeInputController,
                                  labelText: 'Idade',
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {},
                                  validator: (entradaIdade) {
                                    if (entradaIdade == '') {
                                      return "Campo Obrigatório";
                                    }
                                    return null;
                                  },
                                  icon: null,
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
                                      style: TextStyle(fontSize: 16),
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
                                        maskTextInputFormatter:
                                            maskPesoFormatter,
                                        controller: pesoInputController,
                                        labelText: 'Peso em kg',
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {},
                                        validator: (entradaPeso) {
                                          if (entradaPeso == '') {
                                            return "Campo Obrigatório";
                                          }
                                          return null;
                                        },
                                        icon: null,
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
                                              maskTextInputFormatter:
                                                  maskAlturaDoJoelhoFormatter,
                                              controller:
                                                  alturaJoelhoInputController,
                                              labelText:
                                                  'Altura do joelho em cm',
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {},
                                              validator: (alturaDoJoelho) {
                                                if (alturaDoJoelho == '') {
                                                  return "Campo obrigatorio";
                                                }
                                                return null;
                                              },
                                              icon: null,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            MyTextField(
                                              maskTextInputFormatter:
                                                  maskPesoFormatter,
                                              controller:
                                                  circunferenciaBracoInputController,
                                              labelText:
                                                  'Circunferência do braço em cm',
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (value) {},
                                              validator:
                                                  (circunferenciaDoBraco) {
                                                if (circunferenciaDoBraco ==
                                                    '') {
                                                  return "Campo Obrigatório";
                                                }
                                                return null;
                                              },
                                              icon: null,
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
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Temperatura Corporal',
                                  style: TextStyle(fontSize: 16),
                                ),
                                MyDropdownButton(
                                  controller: temperaturaInputController,
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
                                  style: TextStyle(fontSize: 16),
                                ),
                                MyDropdownButton(
                                  controller: atividadeInputController,
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
                                  controller: fatorInjuriaInputController,
                                  labelText: 'Fator injúria',
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {},
                                  validator: (entradaInjuria) {
                                    var convertedEntradaInjuria =
                                        double.tryParse(entradaInjuria);
                                    if (entradaInjuria == '') {
                                      return "Campo Obrigatório";
                                    } else if (convertedEntradaInjuria! >
                                            2.00 ||
                                        convertedEntradaInjuria < 0.50) {
                                      return "O fator injúria deve estar no intervalo entre 0.50 e 2.00";
                                    }
                                    return null;
                                  },
                                  icon: Icons.list,
                                  maskTextInputFormatter:
                                      maskFatorInjuriaFormatter,
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
                                      style: TextStyle(fontSize: 16),
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
                                        maskTextInputFormatter:
                                            maskAlturaFormatter,
                                        controller: alturaInputController,
                                        labelText: 'Altura em cm',
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {},
                                        validator: (value) {
                                          if (value == '') {
                                            return "Campo Obrigatório";
                                          }
                                          return null;
                                        },
                                        icon: null,
                                      ),
                                    ],
                                  ),
                                if (isEstimativaAlturaChecked)
                                  Column(
                                    children: [
                                      MyTextField(
                                        maskTextInputFormatter:
                                            maskAlturaFormatter,
                                        controller: alturaJoelhoInputController,
                                        labelText: 'Altura do joelho em cm',
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) {},
                                        validator: (alturaDoJoelho) {
                                          if (alturaDoJoelho == '') {
                                            return "Campo Obrigatório";
                                          }
                                          return null;
                                        },
                                        icon: null,
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
                      minimumSize: const Size(200, 50),
                      backgroundColor: Colors.green),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultadoTela(
                              sexo: Sexo.values.firstWhere(
                                (e) => e.toString() == sexoInputController.text,
                                orElse: () => Sexo
                                    .nenhum, // Valor padrão se não for encontrado
                              ),
                              etnia: Etnia.values.firstWhere(
                                (e) =>
                                    e.toString() == etniaInputController.text,
                                orElse: () => Etnia.nenhum,
                              ),
                              idade: int.parse(idadeInputController.text),
                              fatorTermico:
                                  TemperaturaCorporal.values.firstWhere(
                                (e) =>
                                    e.toString() ==
                                    temperaturaInputController.text,
                                orElse: () => TemperaturaCorporal.nenhum,
                              ),
                              fatorAtividade: FatorAtividade.values.firstWhere(
                                (e) =>
                                    e.toString() ==
                                    atividadeInputController.text,
                                orElse: () => FatorAtividade.nenhum,
                              ),
                              fatorInjuria: double.parse(
                                  fatorInjuriaInputController.text),
                              peso: pesoInputController,
                              altura: alturaInputController,
                              alturaDoJoelho: alturaJoelhoInputController,
                              circunferenciaDoBraco:
                                  circunferenciaBracoInputController,
                              isEstimativaAlturaChecked:
                                  isEstimativaAlturaChecked,
                              isEstimativaPesoChecked: isEstimativaPesoChecked,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check,
                          color: Colors.white), // Ícone do lado esquerdo
                      SizedBox(width: 8), // Espaço entre o ícone e o texto
                      Text(
                        "Finalizar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
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
