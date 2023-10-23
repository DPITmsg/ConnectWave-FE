import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoolTextField extends StatefulWidget {
  TextEditingController Controller;
  String type;

  CoolTextField({super.key, required this.Controller, required this.type});

  @override
  State<CoolTextField> createState() => _CoolTextFieldState();
}

class _CoolTextFieldState extends State<CoolTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.type,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          hintText: '...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Colors.blue)
          )
      ),
      controller: widget.Controller,
    );
  }
}