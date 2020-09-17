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
  List<UserModel> users = [];

  ScrollController _scrollController;

  @override
  void initState() {
    controller.fetchUsers();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      final maxPosition = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      final positionToLoadMore = maxPosition - 200;
      if (currentPosition >= positionToLoadMore && !controller.pageLoading) {
        controller.fetchUsers();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários'),
      ),
      body: Observer(builder: (BuildContext context) {
        final lenghtItems = controller.users?.result?.length ?? 0;
        final isLoading = controller.pageLoading;

        return ListView.builder(
          controller: _scrollController,
          itemCount: lenghtItems + (isLoading ? 1 : 0),
          itemBuilder: (_, index) {
            final isIndexForLoadingWidget = lenghtItems == index;

            if (controller.users?.status != FutureStatus.fulfilled) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              users = controller.users.value;
            }

            if (users.isEmpty) {
              return Center(
                child: Text('Nenhum usuário encontrado'),
              );
            }

            if (controller.users.error != null) {
              return Center(
                child: Text('Erro ao obter usuários'),
              );
            }

            if (isIndexForLoadingWidget) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CircularProgressIndicator(),
                ),
              );
            }

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
    if (users != null && users.isNotEmpty) {
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
