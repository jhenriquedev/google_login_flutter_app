// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity/connectivity.dart';

abstract class ConnectivityService {
  Future<bool> isOnline();
}

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity connectivity;

  ConnectivityServiceImpl(this.connectivity);

  @override
  Future<bool> isOnline() async {
    //verifica se existe conexão
    final result = await connectivity.checkConnectivity();
    
    final bool isOnline = ( result == ConnectivityResult.wifi || result == ConnectivityResult.mobile );

    return isOnline;
  }

}
