import 'package:flutter/material.dart';

import '../../meu_app.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({super.key});

  Future<bool?> _onBackPressed(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Você tem certeza?'),
        content: const Text(
            'Você irá voltar para a tela anterior e todos os dados serão apagados'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MeuApp()),
              );
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: FilledButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: Colors.green,
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
            Icon(Icons.delete, color: Colors.white), // Ícone do lado esquerdo
            SizedBox(width: 8), // Espaço entre o ícone e o texto
            Text(
              "Refazer cálculos",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
