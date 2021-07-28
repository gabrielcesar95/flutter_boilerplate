import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/form/email_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/user/form/inputs/name_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/user/form/inputs/password_input_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'user_view_controller.dart';

class UserViewPage extends StatefulWidget {
  final int id;

  const UserViewPage({Key key, this.id}) : super(key: key);

  @override
  _UserViewPageState createState() => _UserViewPageState();
}

class _UserViewPageState
    extends ModularState<UserViewPage, UserViewController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.attemptGet(widget.id);

    return Observer(
      builder: (_) => controller.pageLoading == null
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                // TODO: Exibir nome do usuário
                title: Text('Ver Usuário'),
              ),
              key: _scaffoldKey,
              body: SafeArea(
                  child: SingleChildScrollView(
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
                            NameInputWidget(controller.nameController),
                            SizedBox(
                              height: 8,
                            ),
                            EmailInputWidget(controller.emailController),
                            SizedBox(
                              height: 8,
                            ),
                            PasswordInputWidget(controller.passwordController),
                            SwitchListTile.adaptive(
                              title: Text('Ativo'),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              value: controller.active,
                              onChanged: (bool newValue) {
                                controller.toggleActive();
                              },
                            ),
                            // TODO: Exibir apenas se existir model de user
                            SwitchListTile.adaptive(
                              title: Text('E-mail Verificado'),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                              value: controller.emailVerified,
                              onChanged: (bool newValue) {},
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
                                Map<String, dynamic> formData = {
                                  'name': controller.nameController.text,
                                  'email': controller.emailController.text,
                                  'password':
                                      controller.passwordController.text,
                                  'active': controller.active
                                };

                                
                              }
                            },
                            child: Text('Salvar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
            ),
    );
  }
}
