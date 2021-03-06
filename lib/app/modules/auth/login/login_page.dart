import 'package:flutter_boilerplate/app/modules/auth/login/form/email_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/auth/login/form/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Observer(
          builder: (_) => this.controller.loading == true
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          child: Image.asset('assets/img/logo.png'),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        //Form
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              EmailInputWidget(_emailController),
                              SizedBox(
                                height: 8,
                              ),
                              PasswordInputWidget(_passwordController),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RaisedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        this.controller.toggleLoading();
                                        final loginAttempt =
                                            await Modular.get<LoginController>()
                                                .attemptLogin(
                                                    _emailController.text,
                                                    _passwordController.text);

                                        if (loginAttempt is List<SnackBar>) {
                                          loginAttempt.forEach((error) {
                                            _scaffoldKey.currentState
                                                .showSnackBar(error);
                                          });
                                        }

                                        this.controller.toggleLoading();
                                      }
                                    },
                                    child: Text('Login'),
                                  )
                                ],
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
                              onPressed: () {
                                Modular.to.pushReplacementNamed('/register');
                              },
                              child: Text('Criar conta'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
