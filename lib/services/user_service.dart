import 'dart:convert';

import 'package:fakestore2/model/api_response.dart';
import 'package:fakestore2/model/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<APIResponse<User>> getUserData(int id) {
    var myHeaders = {'Content-Type': 'application/json'};
    Uri apiURL = Uri.parse("https://fakestoreapi.com/users/" + id.toString());
    return http.get(apiURL, headers: myHeaders).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
        User user = User(
            firstName: jsonData["name"]["firstname"],
            lastName: jsonData["name"]["lastname"],
            city: jsonData["address"]["city"],
            street: jsonData["address"]["street"],
            zipcode: jsonData["address"]["zipcode"]);

        return APIResponse<User>(data: user);
      }
      return APIResponse<User>(error: true, errorMessage: "An error Occured");
    }).catchError((_) =>
        APIResponse<User>(error: true, errorMessage: "An error Occured"));
  }
}
