import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintName;
  const CustomField({super.key, this.controller, this.hintName});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  // String hintName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          value = widget.controller!.text;
        });
      },
      validator: ((value) =>
          value!.isEmpty ? "Please Enter ${widget.hintName}" : null),
      decoration: InputDecoration(
          hintText: widget.hintName,
          filled: true,
          fillColor: Colors.grey.withOpacity(0.15),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent))),
    );
  }
}
