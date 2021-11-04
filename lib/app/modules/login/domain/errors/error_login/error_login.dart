import 'package:google_login_app/app/core/core.dart';

class ErrorLogin extends Failure {
  @override
  final String message;

  ErrorLogin(this.message);

}
