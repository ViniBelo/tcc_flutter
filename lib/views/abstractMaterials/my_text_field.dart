import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final List<MaskTextInputFormatter> maskTextInputFormatters;
  final bool? fi;
  final IconData icon;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
    required this.icon,
    required this.maskTextInputFormatters,
    this.fi,
  }) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.labelText,
                  style: const TextStyle(fontSize: 30),
                ),
                if (widget.fi != null)
                  IconButton(
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        // Navigate to another screen if widget.fi is not null
                      });
                    },
                    icon: const Icon(Icons.list),
                  ),
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
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                  inputFormatters: widget.maskTextInputFormatters,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    // labelText: widget.labelText,
                    // labelStyle: const TextStyle(
                    //   fontSize: 30,
                    // ),
                    suffixIcon: Icon(
                      widget.icon,
                      size: 40,
                      color: Colors.green,
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
