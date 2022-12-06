import 'dart:convert';
import 'package:domain/domain.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';

class HttpProvider {
  Future<List<User>> getBitbucketData() async {
    try {
      final Response response = await get(
        Uri.parse('https://api.bitbucket.org/2.0/repositories?'),
      );
      final String userData = response.body;
      final userMap = jsonDecode(userData)['values'];
      final List<User> usersList = (userMap as List<dynamic>)
          .map(
            (e) => User.fromBitbucket(e as Map<String, dynamic>),
          )
          .toList();

      return usersList;
    } catch (e) {
      throw e;
    }
  }

  Future<List<User>> getGithubData() async {
    try {
      final Response response = await get(
        Uri.parse('https://api.github.com/repositories?'),
      );
      final String githubData = response.body;
      final userMap = jsonDecode(githubData);
      final List<User> usersList = (userMap as List<dynamic>)
          .map(
            (e) => User.fromGithub(e as Map<String, dynamic>),
          )
          .toList();

      return usersList;
    } catch (e) {
      throw e;
    }
  }
}
