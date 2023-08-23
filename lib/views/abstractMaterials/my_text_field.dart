import 'package:estudos_flutter/views/tela_fator_injuria.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final MaskTextInputFormatter maskTextInputFormatter;
  final IconData? icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
    required this.icon,
    required this.maskTextInputFormatter,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.labelText,
                  style: const TextStyle(fontSize: 16),
                ),
                if (widget.icon != null)
                  IconButton(
                      color: Colors.blue,
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const FatorInjuriaTela();
                            }),
                          );
                        });
                      },
                      icon: Icon(widget.icon)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                TextFormField(
                  textAlign: TextAlign.center,
                  inputFormatters: [widget.maskTextInputFormatter],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
