import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Result<T> {
  ResultType type;
  String message;
  int statusCode;
  T data;

  Result(this.type, this.message, {this.statusCode, this.data});

  Color get color {
    switch (type) {
      case ResultType.Success:
        return Colors.green;
      case ResultType.Warning:
        return Colors.orange;
      case ResultType.Error:
        return Colors.red;
      default:
        return Colors.white;
    }
  }

  IconData get iconData {
    switch (type) {
      case ResultType.Success:
        return Icons.check;
      case ResultType.Warning:
        return Icons.warning;
      case ResultType.Error:
        return Icons.error_outline;
      default:
        return Icons.info_outline;
    }
  }

  Icon get icon {
    switch (type) {
      case ResultType.Success:
        return Icon(iconData, color: color);
      case ResultType.Warning:
        return Icon(iconData, color: color);
      case ResultType.Error:
        return Icon(iconData, color: color);
      default:
        return Icon(Icons.info_outline, color: color);
    }
  }

  Result.fromError(dynamic e) {
    if (e is DioError) {
      // error from dio
      this
        ..type = ResultType.Error
        ..statusCode = e.response != null ? e.response.statusCode : -1;
      switch (e.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          this.message = 'Connection timed out';
          break;
        case DioErrorType.SEND_TIMEOUT:
          this.message = 'Connection timed out';
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          this.message = 'Connection timed out';
          break;
        case DioErrorType.RESPONSE:
          if (statusCode == 401)
            this.message = 'Username atau password salah';
          else
            this.message =
                'Gagal memuat [$statusCode], ${e.response.data["error"]["message"]}';
          this.data = e.response.data;
          break;
        case DioErrorType.CANCEL:
          this.message = 'Request dibatalkan';
          break;
        case DioErrorType.DEFAULT:
          if (e.error is SocketException) {
            this.message = 'Tidak ada internet';
          } else {
            this.message = 'Terjadi kesalahan';
          }
          break;
      }
    } else {
      // error unknown
      this.message = 'Unknown Error : ' + e.toString();
    }
    print('an error occured!');
    print(this.message);
  }
}

enum ResultType { Success, Warning, Error }
