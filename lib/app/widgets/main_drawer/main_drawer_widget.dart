import 'package:flutter_boilerplate/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mdi/mdi.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  color: Colors.grey,
                  margin: EdgeInsets.only(
                    right: 8,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '[Nome do usuário]',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Mdi.accountEdit),
            title: Text(
              'Editar Perfil',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () async {
              
            },
          ),
          ListTile(
            leading: Icon(Icons.power_settings_new),
            title: Text(
              'Sair',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onTap: () async {
              await Modular.get<HomeController>().attemptLogout();
            },
          )
        ],
      ),
    );
  }
}
