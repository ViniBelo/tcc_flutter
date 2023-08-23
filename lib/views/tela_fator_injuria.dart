import 'package:flutter/material.dart';

class FatorInjuriaTela extends StatelessWidget {
  const FatorInjuriaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Fator Injúria'),
      ),
      body: SingleChildScrollView(
        child: Image.asset('assets/images/Tabela-Fator_Injuria-Cortada.png'),
      ),
    );
  }
}
