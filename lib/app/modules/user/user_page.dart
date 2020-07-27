import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/http/api/user_repository.dart';
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
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('new user');
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: UserRepository().list(),
        initialData: [],
        builder: (context, usersList) {
          switch (usersList.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return Center(child: Text('Nenhum usuário encontrado'));
            case ConnectionState.done:
              return ListView.builder(
                itemCount: usersList.data['data'].length,
                itemBuilder: (context, index) {
                  return ListItem(usersList.data['data'][index]);
                },
              );
          }
          return null;
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Map item;

  ListItem(this.item);

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(
          item['name'],
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
