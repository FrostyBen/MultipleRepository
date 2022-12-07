import 'package:core/core.dart';
import 'package:domain/domain.dart';

class GetGitHubDataUsecase implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetGitHubDataUsecase({required this.repository});

  @override
  Future<List<User>> execute(NoParams params) async {
    return await repository.getGitHubData();
  }
}
