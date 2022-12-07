import 'package:data/src/http_provider/http_provider.dart';
import 'package:data/src/repositories/repositories_interface_impl.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void preLaunchSetup() {
  locator.registerLazySingleton(
    () => HttpProvider(),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: locator.get<HttpProvider>(),
    ),
  );
  locator.registerLazySingleton(
    () => GetGitHubDataUsecase(
      repository: locator.get<UserRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => GetBitbucketDataUseCase(
      repository: locator.get<UserRepository>(),
    ),
  );
}
