

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://dummyjson.com')
abstract class RestClient{


  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

   @GET('/products')
   Future<String> getAllProduct();

   @GET('/products/search')
  Future<String> searchProduct(@Query('q') String query);


}