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
    final response = await dio.get('character');
    return response.data;
  }
}
