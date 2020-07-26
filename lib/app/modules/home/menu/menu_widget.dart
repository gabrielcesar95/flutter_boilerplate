import 'package:flutter_boilerplate/app/modules/home/menu/menu_item/menu_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class MenuWidget extends StatelessWidget {
  final List<MenuItemWidget> _buttons = [
    MenuItemWidget(Icons.person, 'Usuários', '/users'),
    MenuItemWidget(Mdi.accountKey, 'Grupos de Acesso', '/roles'),
  ];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 3,
        children: this._buttons,
      ),
    );
  }
}
