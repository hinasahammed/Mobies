import 'dart:convert';
import 'dart:io';

import 'package:mobies/data/app_exception.dart';
import 'package:mobies/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException('');
      default:
        throw FetchDataException('');
    }
  }

  @override
  Future<dynamic> getApi(String url, Map<String, String>? header) async {
    dynamic responseJson;
    try {
      var response = await http.get(Uri.parse(url), headers: header).timeout(
            const Duration(seconds: 20),
          );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on FetchDataException {
      throw FetchDataException();
    }
    return responseJson;
  }
}
