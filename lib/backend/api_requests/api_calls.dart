import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? firstname = '',
    String? address = '',
    int? contactNo,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Register',
      apiUrl: 'http://194.233.69.10/lms/ajax.php?action=userSignup',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'firstname': firstname,
        'address': address,
        'contact_no': contactNo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }

  static dynamic userid(dynamic response) => getJsonField(
        response,
        r'''$.userid''',
      );
}

class LoginCall {
  static Future<ApiCallResponse> call({
    int? contactNo,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'http://194.233.69.10/lms/ajax.php?action=userLogin',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'contact_no': contactNo,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }
}

class OTPVerifyCall {
  static Future<ApiCallResponse> call({
    int? contactNo,
    int? otp,
  }){
    return ApiManager.instance.makeApiCall(
      callName: 'OTP Verify',
      apiUrl: 'http://194.233.69.10/lms/ajax.php?action=userLoginOtpVerify',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'contact_no': contactNo,
        'otp': otp,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
    );
  }

  static dynamic contact(dynamic response) => getJsonField(
        response,
        r'''$.contact_no''',
      );
  static dynamic otp(dynamic response) => getJsonField(
        response,
        r'''$.otp''',
      );
}



class EmiAmountCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Emi Amount',
      apiUrl: 'http://194.233.69.10/lms/ajax.php?action=getAmount',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.amounts''',
      );
}

