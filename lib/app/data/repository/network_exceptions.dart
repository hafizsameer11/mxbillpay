/*
 * @copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 * @author     : Shiv Charan Panjeta < shiv@toxsl.com >
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import '../../export.dart';

class NetworkExceptions {
  static String messageData = "";

  static getDioException(error) {
    if (error is Exception) {
      // reportCrash(error.toString());
      flutterLogger.recordCrash(reportURL: crashBaseUrl, stackTrace: error.toString());
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return messageData = strRequestCancelled;
            case DioExceptionType.connectionTimeout:
              return messageData = strConnectionTimeOut;
            case DioExceptionType.unknown:
              List<String> dateParts = error.message!.split(":");
              List<String> message = dateParts[2].split(",");
              if (message[0].trim() == strConnectionRefused) {
                return messageData = strServerUnderMaintenance;
              } else if (message[0].trim() == strNetworkUnReachable) {
                return messageData = strNetworkUnReachable;
              } else if (dateParts[1].trim() == strFailedToHostLookup) {
                return messageData = strNoInternetConnection;
              } else {
                return messageData = dateParts[1];
              }
            case DioExceptionType.receiveTimeout:
              return messageData = strTimeOut;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case 400:
                  try {
                    return messageData = error.response?.data['message'] ?? 'Unauthorised Exception';
                  } catch (err) {
                    return messageData = err.toString();
                  }
                case 401:
                  PreferenceManger().clearLoginData();
                  return messageData = 'Session Expired.';
                case 403:
                  PreferenceManger().clearLoginData();
                  Get.offAllNamed(AppRoutes.chooseRoleScreen);
                  try {
                    return messageData = error.response?.data['message'] ?? 'Unauthorised Exception';
                  } catch (err) {
                    return messageData = 'Unauthorised Exception';
                  }
                case 404:
                  return messageData = strNotFound;
                case 408:
                  return messageData = strRequestTimeOut;
                case 500:
                  return messageData = strInternalServerError;
                case 503:
                  return messageData = strServiceUnavailable;
                default:
                  return messageData = strSomethingWrong;
              }
            case DioExceptionType.sendTimeout:
              return messageData = strTimeOut;
            case DioExceptionType.badCertificate:
              // TODO: Handle this case.
              break;
            case DioExceptionType.badResponse:
              // TODO: DioExceptionType this case.
              break;
            case DioExceptionType.connectionError:
              return messageData = strInternetException;
          }
        } else if (error is SocketException) {
          return messageData = strSocketExceptions;
        } else {
          return messageData = error.runtimeType.toString();
        }
      } on FormatException catch (_) {
        return messageData = strFormatException;
      } catch (_) {
        return messageData = strUnExceptedException;
      }
    } else {
      return error.toString().contains(strNotSubType) ? messageData = strUnableToProcessData : messageData = strUnExceptedException;
    }
  }
}
