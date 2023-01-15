import 'package:flutter/material.dart';

class CustomFieldPass extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintName;
  const CustomFieldPass({super.key, this.controller, this.hintName});

  @override
  State<CustomFieldPass> createState() => _CustomFieldPassState();
}

class _CustomFieldPassState extends State<CustomFieldPass> {
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
