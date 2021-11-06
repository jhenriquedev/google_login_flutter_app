import 'package:dartz/dartz.dart';
import 'package:google_login_app/app/core/errors/errors.dart';

import '../../login.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> executeLoginGoogle();
}
