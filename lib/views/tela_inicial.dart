import 'package:estudos_flutter/controllers/abstractMaterials/my_checkbox.dart';
import 'package:estudos_flutter/controllers/abstractMaterials/my_dropdown_button.dart';
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
  String _entradaIdade = '';
  String _entradaInjuria = '';
  String _entradaPeso = '';
  String _entradaAltura = '';


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
                              Text('Idade'),
                              TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    _entradaIdade = value;
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
                                  Text('Peso em kg'),
                                  MyCheckBox(),
                                ],
                              ),
                              TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    _entradaPeso = value;
                                  });
                                },
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
                              Text('Fator injúria'),
                              TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                onChanged:(value) {
                                setState(() {
                                  _entradaInjuria = value;
                                });
                              },),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Altura em cm'),
                                  MyCheckBox(
                                  ),
                                ],
                              ),
                              TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                onChanged:(value) {
                                setState(() {
                                  _entradaAltura = value;
                                });
                              },),
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
        return ResultadoTela(
          sexo: _selectedValueSexo,
          etnia: _selectedValueEtnia,
          idade: _entradaIdade,
          peso: _entradaPeso,
          temperatura: _selectedValueTemperatura,
          atividade: _selectedValueAtividade,
          injuria: _entradaInjuria,
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
