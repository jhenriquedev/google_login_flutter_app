// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity/connectivity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_login_app/app/core/core.dart';

import '../domain.dart';

///Precisa executar o comando
///flutter pub run build_runner build
part 'login_with_google.g.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, User>> call();
}

@Injectable() //permite a injeção de dependencia
class LoginWithGoogleImpl implements LoginWithGoogle {
  final LoginRepository loginRepository;
  final Connectivity connectivity;

  LoginWithGoogleImpl(this.loginRepository, this.connectivity);

  @override
  Future<Either<Failure, User>> call() async {
    //Validar se a conexão está com a rede está ativa
    final result = connectivity.checkConnectivity();
    //verifica se existe conexão
    final isOnline = ( result == ConnectivityResult.wifi || result == ConnectivityResult.mobile );

    if (!isOnline) {
      return Left(ErrorLogin(message: Messages.OFFILINE_CONNECTION));
    }

    return loginRepository.executeLoginGoogle();
  }
}
