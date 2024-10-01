import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Text(title),
    TextFormField(decoration: InputDecoration(border: OutlineInputBorder()),),
    ],);
  }
}
