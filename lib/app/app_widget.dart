
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_login_app/app/app_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login with Google',
      theme: ThemeData(
        primaryColor: AppTheme.appColor,
        backgroundColor: AppTheme.backgroundColor,
        textTheme: AppTheme.textTheme,

      ),
      debugShowCheckedModeBanner: false,
    ).modular();
  }
} 