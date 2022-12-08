import 'package:core/core.dart';
import 'package:domain/domain.dart';

class GetBitbucketDataUseCase implements UseCase<List<User>, NoParams> {
  final UserRepository repository;

  GetBitbucketDataUseCase({required this.repository});

  @override
  Future<List<User>> execute(NoParams params) async {
    return await repository.getBitbucketData();
  }
}
