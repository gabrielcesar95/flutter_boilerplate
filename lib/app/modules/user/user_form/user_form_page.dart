import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/form/email_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/user/user_form/form/name_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/user/user_form/form/password_input_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'user_form_controller.dart';

class UserFormPage extends StatefulWidget {
  const UserFormPage({Key key, id}) : super(key: key);

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState
    extends ModularState<UserFormPage, UserFormController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO: Se existir model de user, substituir para "Editar usuário"
        title: Text("Novo Usuário"),
      ),
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(children: [
          Observer(
            builder: (_) => this.controller.loading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                NameInputWidget(this.controller.nameController),
                                SizedBox(
                                  height: 8,
                                ),
                                EmailInputWidget(this.controller.emailController),
                                SizedBox(
                                  height: 8,
                                ),
                                PasswordInputWidget(this.controller.passwordController),
                                SwitchListTile.adaptive(
                                  title: Text('Ativo'),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                  value: this.controller.active,
                                  onChanged: (bool newValue) {
                                    this.controller.toggleActive();
                                  },
                                ),
                                SwitchListTile.adaptive(
                                  title: Text('E-mail Verificado'),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                                  value: this.controller.emailVerified,
                                  onChanged: (bool newValue) {
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //Create Account / Social Login
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 8,
                              ),
                              RaisedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    print('validado');
                                  }
                                },
                                child: Text('Salvar'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ]),
      ),
    );
  }
}
