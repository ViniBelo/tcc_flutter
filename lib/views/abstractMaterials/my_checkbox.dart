import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final bool? isChecked;
  final ValueSetter<bool?>? onChanged;

  const MyCheckBox({Key? key, this.onChanged, this.isChecked})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getFillColor(Set<MaterialState> states) {
      if (isChecked) {
        return Colors.green; // Preenchimento verde quando marcado
      }
      return const Color(0xFFF1FFD6); // Cor de preenchimento padrão
    }

    return Checkbox(
      checkColor: Colors.black, // Cor do ícone de seleção
      fillColor: MaterialStateProperty.resolveWith(getFillColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0), // Borda arredondada
        side: const BorderSide(color: Colors.black), // Cor da borda preta
      ),
    );
  }
}
