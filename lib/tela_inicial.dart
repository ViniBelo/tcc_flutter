import 'package:estudos_flutter/abstractMaterials/my_checkbox.dart';
import 'package:estudos_flutter/abstractMaterials/my_dropdown_button.dart';
import 'package:estudos_flutter/abstractMaterials/my_text_field.dart';
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

  get enabled => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dados do Paciente'),
      ),
      body: Column(
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
                      const Column(
                        children: [
                          Text('Idade'),
                          MyTextField(),
                        ],
                      ),
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Peso em kg'),
                              MyCheckBox(),
                            ],
                          ),
                          MyTextField(),
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
                      const Column(
                        children: [
                          Text('Fator injúria'),
                          MyTextField(),
                        ],
                      ),
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Altura em cm'),
                              MyCheckBox(),
                            ],
                          ),
                          MyTextField(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FilledButton(
            style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const TelaInicial();
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
    );
  }
}
