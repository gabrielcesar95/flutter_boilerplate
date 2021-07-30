import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final IconData _icon;
  final String _text;
  final String _router;

  MenuItemWidget(this._icon, this._text, this._router);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, _router);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                _icon,
                size: 40,
                semanticLabel: _text,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  _text,
                  textAlign: TextAlign.center,
                  
                ),
              )
            ],
          ),
        ),
        margin: EdgeInsets.all(8),
      ),
      height: 112,
      width: 112,
    );
  }
}
