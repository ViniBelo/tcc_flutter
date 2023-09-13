import 'package:flutter/material.dart';

import '../../meu_app.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({super.key});

  Future<bool?> _onBackPressed(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFEAFCE0),
        title: const Text(
          'Você tem certeza?',
          style: TextStyle(fontSize: 30),
        ),
        content: const Text(
          'Você irá voltar para a tela anterior e todos os dados serão apagados',
          style: TextStyle(fontSize: 30),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Não',
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MeuApp()),
              );
            },
            child: const Text(
              'Sim',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 65,
      child: FilledButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: Colors.red,
        ),
        onPressed: () async {
          bool? shouldPop = await _onBackPressed(context);
          if (shouldPop == true) {
            // ignore: use_build_context_synchronously
            Navigator.of(context).pop();
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.replay_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Refazer cálculos",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
