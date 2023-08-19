import 'package:flutter/material.dart';

class MyDropdownButton<T> extends StatefulWidget {
  const MyDropdownButton(
      {super.key,
      required this.selectedValue,
      required this.values,
      required this.labels,
      required this.context,
      required this.onChanged,
      required this.validator});
  final T? selectedValue;
  final List<T> values;
  final List<String> labels;
  final BuildContext context;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;

  @override
  State<MyDropdownButton<T>> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState<T> extends State<MyDropdownButton<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: DropdownButtonFormField<T>(
        value: widget.selectedValue,
        validator: widget.validator,
        onChanged: widget.onChanged,
        borderRadius: BorderRadius.circular(10.0),
        items: widget.values.asMap().entries.map((entry) {
          int index = entry.key;
          T value = entry.value;
          String label = widget.labels[index];
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
                label), // Usar o rótulo personalizado em vez do valor bruto do T
          );
        }).toList(),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
// Widget MyDropdownButton<T>(
//   T? selectedValue,
//   List<T> values,
//   List<String> labels,
//   BuildConatext context,
//   void Function(T?) onChanged,
//   String? Function(T?)? validator,
// ) {
//   return SizedBox(
//     width: MediaQuery.of(context).size.width / 3,
//     child: DropdownButtonFormField<T>(
//       value: selectedValue,
//       onChanged: onChanged,
//       validator: validator,
//       borderRadius: BorderRadius.circular(10.0),
//       items: values.asMap().entries.map((entry) {
//         int index = entry.key;
//         T value = entry.value;
//         String label = labels[index];
//         return DropdownMenuItem<T>(
//           value: value,
//           child: Text(
//               label), // Usar o rótulo personalizado em vez do valor bruto do T
//         );
//       }).toList(),
//     ),
//   );
// }
