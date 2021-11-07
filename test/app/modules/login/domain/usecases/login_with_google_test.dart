import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_login_app/app/core/core.dart';
import 'package:google_login_app/app/modules/login/login.dart';
import 'package:mocktail/mocktail.dart';

///Usar o comando
///flutter test --coverage
/// Usa o plugin coverage gutters

//Criando mocks para simular as classes
class LoginRepositoryMock extends Mock implements LoginRepository {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

main() {
  final loginRepository = LoginRepositoryMock();
  final connectivityService = ConnectivityServiceMock();

  final usecase = LoginWithGoogleImpl(
    loginRepository: loginRepository,
    connectivity: connectivityService,
  );

  test('test failure call usecase', () async {
    when(() => connectivityService.isOnline()).thenAnswer((_) async => false);

    final result = await usecase();

    expect(
        result.leftMap((failure) => failure is ErrorLogin), const Left(true));
    expect(result.fold((failure) => failure.message, id),
        Messages.OFFILINE_CONNECTION);
  });

  test('test success call usecase', () async {
    const user = User(
      uid: '34524',
      name: 'User test',
      email: 'usertest@email.com',
    );

    when(() => connectivityService.isOnline()).thenAnswer((_) async => true);
    when(() => loginRepository.executeLoginGoogle())
        .thenAnswer((_) async => const Right(user));

    final result = await usecase();

    expect(result, const Right(user));
      
    //Testando se o nome está correto
    expect(
      result.fold(id, (user) => user.name), 'User test'
    );
  });
}
