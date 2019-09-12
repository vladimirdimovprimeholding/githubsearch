import 'dart:convert';
import 'package:flutter_template/api/network/result.dart';
import 'package:http/http.dart' as http;

class ApiClient {

  static final String searchRepositoriesUrl = "https://api.github.com/search/repositories?q=";

  Future<ApiResult> fetchRepositories(String name) async {

    var url = searchRepositoriesUrl + name;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var apiResult = ApiResult.fromJson(json.decode(response.body));

      return apiResult;
    } else {
      // If that call was not successful, throw an error.
      return null;
    }
  }
}