import 'package:flutter/material.dart';

class NameInputWidget extends StatefulWidget {
  final TextEditingController controller;
  NameInputWidget(this.controller);

  @override
  _NameInputWidgetState createState() => _NameInputWidgetState();
}

class _NameInputWidgetState extends State<NameInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (val) {
        if (val.isEmpty) {
          return 'Insira seu nome completo';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Nome Completo',
      ),
    );
  }
}
