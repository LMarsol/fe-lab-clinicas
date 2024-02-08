import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './user_login_service.dart';

class UserLoginServiceImpl implements UserLoginService {
  UserLoginServiceImpl({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  Future<Either<ServiceException, Unit>> execute(String email, String password) async {
    final loginResult = await _userRepository.login(email, password);

    switch (loginResult) {
      case Left(value: AuthError()):
        return Left(
          ServiceException(message: 'Erro ao realizar login'),
        );
      case Left(value: AuthUnauthorizedError()):
        return Left(
          ServiceException(message: 'Login ou senha inválido(s)'),
        );
      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        await sp.setString(LocalStorageConstants.accessToken, accessToken);
        return Right(unit);
    }
  }
}
