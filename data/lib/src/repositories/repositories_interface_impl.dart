import 'package:data/src/http_provider/http_provider.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends UserRepository {
  final HttpProvider remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<User>> getBitbucketData() async {
    return await remoteDataSource.getBitbucketData();
  }

  @override
  Future<List<User>> getGitHubData() async {
    return await remoteDataSource.getGithubData();
  }
}
