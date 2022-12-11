import 'package:dio/dio.dart';

import '../../constants/strings.dart';

class ImagesWebService {
  late Dio dio;

  ImagesWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, //20 seconds
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllImages() async {
    try {
      final queryParameters = {
        'client_id': 'Cll6lskv6_Yg4xZR_hwKXDVlh__GO2dmNNYp3ANeMpY',
      };
      Response response = await dio.get('https://api.unsplash.com/photos',queryParameters: queryParameters);
      print(response.data.toString());

      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
