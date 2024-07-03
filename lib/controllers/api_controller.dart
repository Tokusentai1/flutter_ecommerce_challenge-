import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiController {
  //to make the api call more flexible we used generic function so that we can use this api call with any type of model
  Future<T?> fetechData<T>(
      {required String uri,
      required T Function(Map<String, dynamic>) fromJson}) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      return fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  /*this api is for getting a list of data from the model we also used generic function to make it more flexible 
  we also made from json dynamic instead of map because we have a category api which retuns a list of category with out keys
  so in order to make this api works for both categories and all products we used dynamic*/

  Future<List<T>?> fetechAllData<T>(
      {required String uri, required T Function(dynamic) fromJson}) async {
    final response = await http.get(Uri.parse(uri));
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse is List) {
        return jsonResponse.map((json) => fromJson(json)).toList();
      } else {
        return null;
      }
    }
    return null;
  }
}
