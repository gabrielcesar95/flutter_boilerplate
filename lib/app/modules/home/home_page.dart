import 'package:flutter_boilerplate/app/modules/home/menu/menu_widget.dart';
import 'package:flutter_boilerplate/app/widgets/main_drawer/main_drawer_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, this.title = "Home Page"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MenuWidget(),
            ]),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
      endDrawer: MainDrawerWidget(),
    );
  }
}
