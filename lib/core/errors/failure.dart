import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout whith ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout whith ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recive timeout whith ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.frombadResponse(
            dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to Apiserver was canceld');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error ,please try again');

      default:
        return ServerFailure('Oop there was an error , please try again');
    }
  }

  factory ServerFailure.frombadResponse(int statuscode, dynamic badresponse) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailure(badresponse['error']['message']);
    } else if (statuscode == 404) {
      return ServerFailure('Your request not found , pleasec try later');
    } else if (statuscode == 500) {
      return ServerFailure('Internal server error , pleasec try later');
    } else {
      return ServerFailure('Oop there was an error , please try again');
    }
  }
}
