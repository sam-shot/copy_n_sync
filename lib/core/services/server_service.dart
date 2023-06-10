import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.logger.dart';
import 'package:copy_n_sync/core/services/api_service.dart';
import 'package:copy_n_sync/core/services/network_service.dart';

class ServerService {
  final log = getLogger("ServerService");
  final _apiService = locator<ApiService>();
  final _networkService = locator<NetworkService>();

  Future register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    const route = "/auth/register";
    final response = await _networkService.fmt(() {
      return _apiService.post(route: route, body: {
        "name": name,
        "username": username,
        "email": email,
        "password": password
      });
    });
     return response.fold((l) => l, (r) {
      // final dataResponse = UserResponse.fromJson(r);
      log.v("Server created : $response");
      return r;
    });
  }

  Future getTexts({
    required String id,
  }) async {
    const route = "/get/texts";
    final response = await _networkService.fmt(() {
      return _apiService.get(route: route, queryParameters: {"id": id});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }
  Future getUserDetails({
    required String id,
  }) async {
    const route = "/get/userdetail";
    final response = await _networkService.fmt(() {
      return _apiService.get(route: route, queryParameters: {"id": id});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }

  Future login({
    required String email,
    required String password,
  }) async {
    const route = "/auth/login";
    final response = await _networkService.fmt(() {
      return _apiService
          .post(route: route, body: {"email": email, "password": password});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }

  Future sendToDatabase({
    required String text,
    required String id,
  }) async {
    const route = "/send/text";
    final response = await _networkService.fmt(() {
      return _apiService
          .post(route: route, body: {"text": text, "id": id});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }


  Future forgotPassword({
    required String email,
  }) async {
    const route = "/auth/forgotpassword";
    final response = await _networkService.fmt(() {
      return _apiService
          .post(route: route, body: {"email": email});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }

  Future verifyForgotPassword({
    required String email,
    required String code,
  }) async {
    const route = "/auth/forgotpassword/verify";
    final response = await _networkService.fmt(() {
      return _apiService
          .post(route: route, body: {"email": email, "code": code});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }


  Future updatePassword({
    required String token,
    required String password,
  }) async {
    const route = "/auth/forgotpassword/updatePassword";
    final response = await _networkService.fmt(() {
      return _apiService
          .post(route: route, body: {"token": token, "password": password});
    });
    return response.fold((l) => l, (r) {
      log.v("Server created : $response");
      return r;
    });
  }
}
