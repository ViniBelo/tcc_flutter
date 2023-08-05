import 'package:estudos_flutter/abstractMaterials/MyDropdownButton.dart';
import 'package:estudos_flutter/models/enums/Etnia.dart';
import 'package:estudos_flutter/models/enums/Fator_Atividade.dart';
import 'package:estudos_flutter/models/enums/Sexo.dart';
import 'package:estudos_flutter/models/enums/Temperatura_Corporal.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dados do Paciente'),
      ),
      body: Container(
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
                  Text('Idade'),
                  Text('Peso em kg'),
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
                  Text('Fator injúria'),
                  Text('Altura em cm'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
