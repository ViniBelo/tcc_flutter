import 'package:estudos_flutter/MyDropdownButton.dart';
import 'package:estudos_flutter/enums/Etnia.dart';
import 'package:estudos_flutter/enums/Fator_Atividade.dart';
import 'package:estudos_flutter/enums/Sexo.dart';
import 'package:estudos_flutter/enums/Temperatura_Corporal.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  Sexo _selectedValueSexo = Sexo.homem;
  Etnia _selectedValueEtnia = Etnia.branco;
  TemperaturaCorporal _selectedValueTemperatura = TemperaturaCorporal.semFebre;
  FatorAtividade _selectedValueAtividade = FatorAtividade.confinadoAoLeito;

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
                  MyDropdownButton<Sexo>(
                    _selectedValueSexo,
                    Sexo.values,
                    (newValue) {
                      setState(() {
                        _selectedValueSexo = newValue!;
                      });
                    },
                  ),
                  MyDropdownButton<Etnia>(
                    _selectedValueEtnia,
                    Etnia.values,
                    (newValue) {
                      setState(() {
                        _selectedValueEtnia = newValue!;
                      });
                    },
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
                  MyDropdownButton<TemperaturaCorporal>(
                    _selectedValueTemperatura,
                    TemperaturaCorporal.values,
                    (newValue) {
                      setState(() {
                        _selectedValueTemperatura = newValue!;
                      });
                    },
                  ),
                  MyDropdownButton<FatorAtividade>(
                    _selectedValueAtividade,
                    FatorAtividade.values,
                    (newValue) {
                      setState(() {
                        _selectedValueAtividade = newValue!;
                      });
                    },
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
