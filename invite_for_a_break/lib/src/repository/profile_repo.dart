import 'dart:convert';

import 'package:invite_for_a_break/config/config.dart';
import 'package:invite_for_a_break/src/bloc/session/session_cubit.dart';
import 'package:invite_for_a_break/src/models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepo {
  final SessionCubit sessionCubit;

  ProfileRepo({required this.sessionCubit});

  Future<Profile> getProfile(int? userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    var response = http.Response('', 200);
    if (userId == null) {
      response = await http.get(
        Uri.parse('${Config.baseUrl}/profile/profile'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json-patch+json',
          'Authorization': 'Bearer $token',
        },
      );
    } else {
      response = await http.get(
        Uri.parse(
            '${Config.baseUrl}/profile/profile?requested_user_id=$userId'),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json-patch+json',
          'Authorization': 'Bearer $token',
        },
      );
    }

    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 401) {
      sessionCubit.showAtuh();
      throw Exception('Failed to load profile');
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<Profile> updateProfile(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.put(
      Uri.parse('${Config.baseUrl}/profile/profile_update'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json-patch+json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(profile.toJson()),
    );

    if (response.statusCode == 200) {
      return profile;
    } else if (response.statusCode == 401) {
      sessionCubit.showAtuh();
      throw Exception('Failed to load profile');
    } else {
      throw Exception('Failed to load profile');
    }
  }
}
