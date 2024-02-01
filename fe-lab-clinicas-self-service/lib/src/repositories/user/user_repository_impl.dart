import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  final RestClient _restClient;

  @override
  Future<Either<AuthException, String>> login(String email, String password) async {
    try {
      final Response(data: {'access_token': accessToken}) = await _restClient.unauth.post(
        '/auth',
        data: {'email': email, 'password': password},
      );

      return Right(accessToken);
    } on DioException catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);

      return switch (e) {
        DioException(response: Response(statusCode: HttpStatus.forbidden)?) => Left(AuthUnauthorizedError()),
        _ => Left(AuthError('Erro ao realizar login. Por favor, tente novamente'))
      };
    }
  }
}
