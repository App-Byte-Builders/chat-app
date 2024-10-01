import 'package:chat_app/login/ui/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class LoginUiScreen extends StatelessWidget {
  const LoginUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Column(children: [
      Text('Welcome'),
      CustomTextFields(title: 'Phone'),
      CustomTextFields(title: 'Password'),

    ],),);
  }
}
