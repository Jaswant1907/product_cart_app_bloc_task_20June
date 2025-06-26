
import 'package:dio/dio.dart';

import '../rest_client/rest_client.dart';

final dio = Dio(BaseOptions(
  headers: {
    'Content-Type' : 'application/json'
  }
)
);

final restClient = RestClient(Dio());