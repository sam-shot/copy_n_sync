import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.logger.dart';
import 'package:copy_n_sync/core/models/register/register.dart';
import 'package:copy_n_sync/core/services/api_service.dart';

class ServerService {
  final log = getLogger("ServerService");
  final _apiService = locator<ApiService>();

  Future register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    const route = "/auth/register";
    final response = await _apiService.post(route: route, body: {
      "name": "name",
      "username": username,
      "email": email,
      "password": password
    });
    return response;
  }
}
