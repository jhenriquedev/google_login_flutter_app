import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_login_app/app/modules/login/domain/usecases/login_with_google.dart';

class LoginModule extends Module {

  @override
  List<Bind> get binds => [
    $LoginWithGoogleImpl //injeção de dependencia
  ];

  @override
  List<ModularRoute> get routes => [];

}