import 'package:flutter_boilerplate/app/modules/auth/register/form/email_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/auth/register/form/name_input_widget.dart';
import 'package:flutter_boilerplate/app/modules/auth/register/form/password_input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

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
                            ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  this.controller.toggleLoading();
                                  final registerAttempt =
                                      await Modular.get<RegisterController>()
                                          .attemptRegister(
                                    _nameController.text,
                                    _emailController.text,
                                    _passwordController.text,
                                  );

                                  if (registerAttempt is List<SnackBar>) {
                                    registerAttempt.forEach((error) {
                                      _scaffoldKey.currentState!
                                          .showSnackBar(error);
                                    });
                                  }
                                  this.controller.toggleLoading();
                                }
                              },
                              child: Text('Cadastrar'),
                            ),
                            // ),
                            SizedBox(
                              height: 8,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Modular.to.navigate('/login');
                              },
                              child: Text('Já tenho uma conta'),
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
