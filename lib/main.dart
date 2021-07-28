import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app/app_module.dart';
import 'package:flutter_boilerplate/app/app_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await DotEnv().load('.env');
  await Hive.initFlutter();

  runApp(ModularApp(
    module: AppModule(),
    child: AppWidget(),
  ));
}
