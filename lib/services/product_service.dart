import 'dart:convert';
import 'package:fakestore2/model/api_response.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<APIResponse<List<String>>> getAllCategories() {
    var myHeaders = {'Content-Type': 'application/json'};
    Uri apiURL = Uri.parse('https://fakestoreapi.com/products/categories');

    return http.get(apiURL, headers: myHeaders).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
        List<String> categories = [];
        for (var category in jsonData) {
          print(category);
          categories.add(category);
        }

        return APIResponse<List<String>>(data: categories);
      }
      return APIResponse<List<String>>(
          error: true, errorMessage: "An error occured");
    }).catchError((_) => APIResponse<List<String>>(
        error: true, errorMessage: 'An error occured'));
  }
}
