import 'package:flutter/material.dart';

abstract class AbstractDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> values;
  final void Function(String?) onChanged;

  AbstractDropdownWidget({
    required this.selectedValue,
    required this.values,
    required this.onChanged,
  });

  Widget buildDropdownButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Título do Dropdown:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          buildDropdownButton(),
        ],
      ),
    );
  }
}
