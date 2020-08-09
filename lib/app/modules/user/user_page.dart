import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'user_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ModularState<UserPage, UserController> {
  final userController = Modular.get<UserController>();

  List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('new user');
            },
          )
        ],
      ),
      body: Observer(builder: (BuildContext context) {
        if (userController.users.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (userController.users.value == []) {
          return Center(
            child: Text("Nenhum usuário encontrado"),
          );
        }

        if (userController.users.error != null) {
          return Center(
            child: Text("Erro ao obter usuários"),
          );
        }

        users = userController.users.value;

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListItem(users[index]);
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    users.clear();
    super.dispose();
  }
}

class ListItem extends StatelessWidget {
  final UserModel item;

  ListItem(this.item);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          item.name,
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
      );
}
