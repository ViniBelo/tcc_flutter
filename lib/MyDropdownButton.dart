import 'package:flutter/material.dart';

Widget MyDropdownButton<T>(
  T? selectedValue,
  List<T> values,
  void Function(T?) onChanged,
) {
  return DropdownButton<T>(
    value: selectedValue,
    onChanged: onChanged,
    items: values.map((T value) {
      return DropdownMenuItem<T>(
        value: value,
        child: Text(value.toString()),
      );
    }).toList(),
  );
}
