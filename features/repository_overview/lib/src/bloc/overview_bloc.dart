import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';

part 'overview_event.dart';
part 'overview_state.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  final GetGitHubDataUsecase getDataUsecase;
  final GetBitbucketDataUseCase getBitbucketDataUseCase;
  final String errorMessage = 'something went wrong';
  OverviewBloc({
    required this.getBitbucketDataUseCase,
    required this.getDataUsecase,
  }) : super(OverviewState()) {
    on<GetData>(_getData);
  }

  Future<void> _getData(GetData event, Emitter<OverviewState> emit) async {
    try {
      late List<User> bitbucketData;
      late List<User> gitHubData;

      await Future.wait(
        [
          (() async {
            bitbucketData = await getBitbucketDataUseCase.execute(NoParams());
          })(),
          (() async {
            gitHubData = await getDataUsecase.execute(NoParams());
          })(),
        ].toList(),
      );

      final List<User> usersData = List<User>.from(bitbucketData)
        ..addAll(gitHubData);

      emit(
        OverviewLoaded(
          usersData: usersData,
        ),
      );
    } catch (e) {
      emit(
        Error(
          errorMessage: errorMessage,
        ),
      );
    }
  }
}
