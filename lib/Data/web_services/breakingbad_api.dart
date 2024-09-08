import 'dart:math';

import 'package:dio/dio.dart';

import '../../constant/Strings.dart';

class BreakingBadApi {
  late Dio dio;

  BreakingBadApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getCharacters() async {
    try {
      Response response = await dio.get('characters');
      log(response.data['results']);
      return response.data['results'];
    } catch (e) {
      return [];
    }
  }
}
