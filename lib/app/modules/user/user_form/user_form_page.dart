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

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

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
                                NameInputWidget(_nameController),
                                SizedBox(
                                  height: 8,
                                ),
                                EmailInputWidget(_emailController),
                                SizedBox(
                                  height: 8,
                                ),
                                PasswordInputWidget(_passwordController),
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
