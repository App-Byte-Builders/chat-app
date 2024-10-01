import 'package:chat_app/login/ui/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class RegisterUiScreen extends StatelessWidget {
  const RegisterUiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Column(children: [
      Text('Welcome'),
      CustomTextFields(title: 'Phone'),
      CustomTextFields(title: 'Password'),

      ElevatedButton(onPressed: (){}, child: Text('Login'))

    ],),);
  }
}
