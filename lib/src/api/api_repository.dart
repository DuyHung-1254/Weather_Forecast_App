import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

class ApiRepository {
  final String url;
  // final Map<String, dynamic> payload;

  ApiRepository({required this.url});

  Dio _dio = Dio();

  void get({
    void Function()? beforeSend,
    void Function(dynamic data)? onSuccess,
    void Function(dynamic error)? onError,
  }) {
    _dio.get(url).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError((error) {
      if (onError != null) {
        onError(error);
      }
    });
  }
}
