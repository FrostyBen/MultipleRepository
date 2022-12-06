import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/repositories/repository_interface.dart';
import 'package:domain/src/usecases/no_params.dart';

class GetGitHubDataUsecase implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetGitHubDataUsecase({required this.repository});

  @override
  Future<List<User>> execute(NoParams params) async {
    return await repository.getGitHubData();
  }
}
