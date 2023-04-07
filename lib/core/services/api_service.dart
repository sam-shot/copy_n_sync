import 'package:copy_n_sync/app/app.logger.dart';
import 'package:copy_n_sync/core/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final log = getLogger("APIService");
  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  Future<dynamic> get({
    required String route,
    String? token,
    Map<String, String>? queryParameters,
  }) async {
    log.v("Getting data from $route");

    var response = await dio.get(route,
        queryParameters: queryParameters,
        options: Options(headers: {"Authorization": token}));
    log.v("the data fro $route is ${response.data}");
    return response;
  }

  Future<dynamic> post({
    required String route,
    String? token,
    required Map<String, dynamic> body,
  }) async {
    log.v("Posting data from $route");

    var response = await dio.post(route,
        data: body, options: Options(headers: {"Authorization": token}));
    log.v("The data from $route is ${response.data}");
    return response;
  }
}
