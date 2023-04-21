import 'package:copy_n_sync/app/app.locator.dart';
import 'package:copy_n_sync/app/app.logger.dart';
import 'package:copy_n_sync/core/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:stacked_services/stacked_services.dart';

class NetworkService{
  
  final navigation = locator<NavigationService>();
  final _dialog = locator<DialogService>();
  final _log = getLogger("NetworkService");
  final snackbar = locator<SnackbarService>();

  Future<Either<dynamic, dynamic>> fmt(Function function) async {
    try {
      return Right(await function.call());
    }on DioError catch (e) {
      
      final errorMessage = DioExceptions.fromDioError(e).toString();
      _log.v(errorMessage);
      snackbar.showSnackbar(message: errorMessage);
      return Left(errorMessage);
    }
  }
  
}