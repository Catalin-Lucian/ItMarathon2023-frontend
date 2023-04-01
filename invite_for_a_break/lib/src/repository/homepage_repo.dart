import 'dart:convert';

import 'package:invite_for_a_break/config/config.dart';
import 'package:invite_for_a_break/src/models/search_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomepageRepo {
  Future<List<SearchUser>> getUsers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var response = await http.get(
      Uri.parse('${Config.baseUrl}/profile/users?page=0&items_per_page=10'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json-patch+json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var userList = jsonDecode(response.body);
      var returnList = <SearchUser>[];
      for (var user in userList) {
        returnList.add(SearchUser.fromJson(user));
      }
      return returnList;
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<SearchUser>> searchUsers(String searchString) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var response = await http.get(
      Uri.parse('${Config.baseUrl}/profile/search?search_string=$searchString'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json-patch+json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var userList = jsonDecode(response.body);
      var returnList = <SearchUser>[];
      for (var user in userList) {
        returnList.add(SearchUser.fromJson(user));
      }
      return returnList;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
