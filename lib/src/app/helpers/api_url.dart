import 'package:dio/dio.dart';
import 'constants.dart';

class ApiUrl {
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Constants.BASE_API_URL,
    receiveTimeout: Constants.RECEIVE_TIMEOUT,
    connectTimeout: Constants.CONNECT_TIMEOUT,
    responseType: ResponseType.json,
  );

  static const MENU_URL =
      Constants.BASE_API_URL + 'index.json';
}
