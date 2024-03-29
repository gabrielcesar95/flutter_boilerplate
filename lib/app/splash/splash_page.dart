import 'package:flutter_boilerplate/app/http/api/oauth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashScreen'}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final OauthService _oauthService = OauthService();

  @override
  void initState() {
    super.initState();

    isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    isLoggedIn();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          child: Image.asset('assets/img/logo.png'),
        )
      ],
    );
  }

  void isLoggedIn() {
    _oauthService.ensureLoggedIn().then((loggedIn) => loggedIn
        ? Modular.to.navigate('/home')
        : Modular.to.navigate('/login'));
  }
}
