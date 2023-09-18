import 'package:flutter/material.dart';

class MyDropdownButton<T> extends StatefulWidget {
  const MyDropdownButton(
      {super.key,
      required this.selectedValue,
      required this.values,
      required this.labels,
      required this.context,
      required this.onChanged,
      required this.validator,
      required this.controller,
      required this.icon});
  final T? selectedValue;
  final List<T> values;
  final List<String> labels;
  final BuildContext context;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;
  final TextEditingController controller;
  final IconData icon;

  @override
  State<MyDropdownButton<T>> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState<T> extends State<MyDropdownButton<T>> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = widget.selectedValue.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 3) +
          (MediaQuery.of(context).size.width / 11),
      child: DropdownButtonFormField<T>(
        iconEnabledColor: Colors.green,
        icon: Icon(widget.icon),
        iconSize: 40,
        dropdownColor: // Um tom de verde pastel muito claro
            const Color(0xFFF1FFD6),
        value: widget.selectedValue,
        validator: widget.validator,
        onChanged: (newValue) {
          widget.controller.text = newValue.toString();
          widget.onChanged(newValue);
        },
        isExpanded: true,
        borderRadius: BorderRadius.circular(10.0),
        decoration: const InputDecoration(),
        items: widget.values.asMap().entries.map((entry) {
          int index = entry.key;
          T value = entry.value;
          String label = widget.labels[index];
          return DropdownMenuItem<T>(
            value: value,
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  height: 1.5,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
