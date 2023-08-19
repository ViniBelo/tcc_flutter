import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final TextInputType keyboardType;
  final Function(String) onChanged;
  final FormFieldValidator validator;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.keyboardType,
    required this.onChanged,
    required this.validator,
    List<TextInputFormatter>? inputFormatters,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 120, right: 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.labelText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged,
              validator: widget.validator,
            ),
          ],
        ),
      ),
    );
  }
}
