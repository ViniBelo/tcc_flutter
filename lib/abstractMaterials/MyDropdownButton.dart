import 'package:flutter/material.dart';

Widget MyDropdownButton<T>(
  T? selectedValue,
  List<T> values,
  List<String> labels, // Adicione a lista de rótulos personalizados
  void Function(T?) onChanged,
) {
  return DropdownButton<T>(
    value: selectedValue,
    onChanged: onChanged,
    items: values.asMap().entries.map((entry) {
      int index = entry.key;
      T value = entry.value;
      String label = labels[index];
      return DropdownMenuItem<T>(
        value: value,
        child: Text(
            label), // Usar o rótulo personalizado em vez do valor bruto do enum
      );
    }).toList(),
  );
}
