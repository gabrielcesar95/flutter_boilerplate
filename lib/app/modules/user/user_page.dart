import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ModularState<UserPage, UserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Fulano de Tal',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            trailing: InkWell(
              child: Icon(Icons.edit),
              onTap: () {
                print("edit");
              },              
            ),
            onTap: () async {
              print('view');
            },
          ),
        ],
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('add user');
        },
      ),
    );
  }
}
