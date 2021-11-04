import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_login_app/app/app_widget.dart';
import 'package:google_login_app/app/core/pages/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const SplashPage()),
    ChildRoute('/logged', child: (_, __) => Container(
      color: Colors.green,
    )),
  ];

  //Widget get bootstrap => const AppWidget();
}
