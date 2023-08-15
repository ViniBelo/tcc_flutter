import 'package:flutter/material.dart';

import '../meu_app.dart';

class MyFilledButton extends StatelessWidget {
  Future<bool?> _onBackPressed(BuildContext context) async {
    return showDialog<bool?>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Você tem certeza?'),
        content: Text('Você irá voltar para a tela anterior e todos os dados serão apagados'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Não'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MeuApp()),
              );
            },
            child: Text('Sim'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: FilledButton(
        style:
            OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
        onPressed: () async {
          bool? shouldPop = await _onBackPressed(context);
          if (shouldPop == true) {
            Navigator.of(context).pop();
          }
        },
        child: Text('Refazer cálculos'),
      ),
    );
  }
}