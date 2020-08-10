import 'package:flutter/material.dart';

class PasswordInputWidget extends StatefulWidget {
  final TextEditingController controller;
  PasswordInputWidget(this.controller);

  @override
  _PasswordInputWidgetState createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: true,
      validator: (val) {
        if (val.isEmpty) {
          return 'Insira sua senha';
        }
        if (val.length < 8) {
          return 'A senha deve conter pelo menos 8 dígitos';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Senha',
      ),
    );
  }
}
