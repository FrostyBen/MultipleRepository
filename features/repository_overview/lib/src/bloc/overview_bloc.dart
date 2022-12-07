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
  }) : super(OverviewState(
            usersData: <User>[],
            isSortedAlphabetic: false,
            isSortedBySource: false)) {
    on<GetData>(_getData);
    on<AlphabeticSort>(_alphabeticSort);
    on<SourceSort>(_sourceSort);
  }

  void _sourceSort(SourceSort event, Emitter<OverviewState> emit) {
    final bool isSort = !event.isSortbysource;
    final List<User> sourceSort = state.usersData;
    if (isSort) {
      sourceSort.sort(
        (User a, User b) => a.source!.compareTo(b.source!),
      );
    } else {
      sourceSort.sort(
        (User a, User b) => b.source!.compareTo(a.source!),
      );
    }
    emit(
      OverviewState(
        isSortedBySource: isSort,
        isSortedAlphabetic: state.isSortedAlphabetic,
        usersData: state.usersData,
      ),
    );
  }

  void _alphabeticSort(AlphabeticSort event, Emitter<OverviewState> emit) {
    final bool isSort = !event.isSortAlphabetic;
    final List<User> alphabeticList = state.usersData;
    if (isSort) {
      alphabeticList.sort(
        (User a, User b) => a.fullName!.compareTo(b.fullName!),
      );
    } else {
      alphabeticList.sort(
        (User a, User b) => b.fullName!.compareTo(a.fullName!),
      );
    }
    emit(
      OverviewState(
        usersData: alphabeticList,
        isSortedAlphabetic: isSort,
        isSortedBySource: state.isSortedBySource,
      ),
    );
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
        Loading(
          isSortedAlphabetic: state.isSortedAlphabetic,
          usersData: state.usersData,
          isSortedBySource: state.isSortedBySource,
        ),
      );
      emit(
        OverviewState(
          usersData: usersData,
          isSortedAlphabetic: state.isSortedAlphabetic,
          isSortedBySource: state.isSortedBySource,
        ),
      );
    } catch (e) {
      emit(
        Error(
          errorMessage: errorMessage,
          usersData: state.usersData,
          isSortedAlphabetic: state.isSortedAlphabetic,
          isSortedBySource: state.isSortedBySource,
        ),
      );
    }
  }
}
