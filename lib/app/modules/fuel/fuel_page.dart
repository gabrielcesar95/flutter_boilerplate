import 'package:flutter/material.dart';

class FuelPage extends StatefulWidget {
  final String title;
  const FuelPage({Key key, this.title = "Consumo de Combustível"})
      : super(key: key);

  @override
  _FuelPageState createState() => _FuelPageState();
}


class _FuelPageState extends State<FuelPage> {
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
