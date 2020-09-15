import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_boilerplate/app/models/user/user_model.dart';
import 'package:flutter_boilerplate/app/modules/user/list/users_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ModularState<UserPage, UsersController> {
  final userController = Modular.get<UsersController>();

  List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: Observer(builder: (BuildContext context) {
        if (userController.users.status == FutureStatus.pending) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (userController.users.value == []) {
          return Center(
            child: Text('Nenhum usuário encontrado'),
          );
        }

        if (userController.users.error != null) {
          return Center(
            child: Text('Erro ao obter usuários'),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Modular.link.pushNamed('/new');
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 32,
        ),
      ),
    );
  }

  @override
  void dispose() {
    if(users != null && users.isNotEmpty){
      users.clear();
    }
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
            print('edit');
          },
        ),
        onTap: () async {
          print('view');
        },
      );
}
