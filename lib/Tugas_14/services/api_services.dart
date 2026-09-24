import 'package:android_dev/Tugas_14/models/product_models.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

// 1. Ubah baseUrl ke root domain agar path tidak terduplikasi
@RestApi(baseUrl: 'https://dummyjson.com/')
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  // Endpoint yang dipanggil akan menjadi: https://dummyjson.com/products
  @GET('products')
  Future<ProductModels> getAllProducts();
}
