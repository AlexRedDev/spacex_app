import 'package:dio/dio.dart';

class HttpClient {
  static final _options = BaseOptions(baseUrl: 'https://api.spacexdata.com/v3');
  static final Dio api = Dio(_options);
}
