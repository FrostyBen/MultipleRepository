import 'package:domain/src/entity/user.dart';

abstract class UserRepository {
  Future<List<User>> getBitbucketData();
  Future<List<User>> getGitHubData();
}
