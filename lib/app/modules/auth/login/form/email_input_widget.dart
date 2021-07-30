import 'package:flutter_boilerplate/app/utils/validation_utils.dart';
import 'package:flutter/material.dart';

class EmailInputWidget extends StatefulWidget {
  final TextEditingController controller;
  EmailInputWidget(this.controller);

  @override
  _EmailInputWidgetState createState() => _EmailInputWidgetState();
}

class _EmailInputWidgetState extends State<EmailInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Insira seu e-mail';
        }
        if (isEmail(val)) {
          return 'E-mail inválido';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'E-mail',
      ),
    );
  }
}
