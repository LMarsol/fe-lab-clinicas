import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fe_lab_clinicas_core/src/rest_client/interceptors/auth_interceptor.dart';

final class RestClient extends DioForNative {
  RestClient(String baseUrl)
      : super(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(AuthInterceptor());
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  RestClient get auth {
    options.extra['dioAuthKey'] = true;
    return this;
  }

  RestClient get unauth {
    options.extra['dioAuthKey'] = false;
    return this;
  }
}
