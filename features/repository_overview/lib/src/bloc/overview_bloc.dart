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
  }) : super(
          OverviewState(
            usersData: <User>[],
            isSortedAlphabetic: false,
            isSortedBySource: false,
            backupList: <User>[],
          ),
        ) {
    on<GetData>(_getData);
    on<AlphabeticSort>(_alphabeticSort);
    on<SourceSort>(_sourceSort);
    on<Filter>(_filter);
  }

  void _filter(Filter event, Emitter<OverviewState> emit) {
    List<User> result = <User>[];
    if (event.input.isNotEmpty) {
      result = state.usersData
          .where(
            (User user) => (user.name).toLowerCase().contains(
                  event.input.toLowerCase(),
                ),
          )
          .toList();
    } else {
      result = state.backupList;
    }

    emit(
      OverviewState(
        isSortedBySource: state.isSortedBySource,
        isSortedAlphabetic: state.isSortedAlphabetic,
        usersData: result,
        backupList: state.backupList,
      ),
    );
  }

  void _sourceSort(SourceSort event, Emitter<OverviewState> emit) {
    final bool isSort = !event.isSortbysource;
    final List<User> sourceSort = state.usersData;
    if (isSort) {
      sourceSort.sort(
        (User a, User b) => a.source.compareTo(b.source),
      );
    } else {
      sourceSort.sort(
        (User a, User b) => b.source.compareTo(a.source),
      );
    }
    emit(
      OverviewState(
        isSortedBySource: isSort,
        isSortedAlphabetic: state.isSortedAlphabetic,
        usersData: state.usersData,
        backupList: state.backupList,
      ),
    );
  }

  void _alphabeticSort(AlphabeticSort event, Emitter<OverviewState> emit) {
    final bool isSort = !event.isSortAlphabetic;
    final List<User> alphabeticList = state.usersData;
    if (isSort) {
      alphabeticList.sort(
        (User a, User b) => a.fullName.compareTo(b.fullName),
      );
    } else {
      alphabeticList.sort(
        (User a, User b) => b.fullName.compareTo(a.fullName),
      );
    }
    emit(
      OverviewState(
        usersData: alphabeticList,
        isSortedAlphabetic: isSort,
        isSortedBySource: state.isSortedBySource,
        backupList: state.backupList,
      ),
    );
  }

  Future<void> _getData(GetData event, Emitter<OverviewState> emit) async {
    try {
      late List<User> bitbucketData;
      late List<User> gitHubData;

      await Future.wait(
        <Future<dynamic>>[
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
      final List<User> backuplist = List<User>.from(bitbucketData)
        ..addAll(gitHubData);
      emit(
        OverviewState(
          usersData: usersData,
          isSortedAlphabetic: state.isSortedAlphabetic,
          isSortedBySource: state.isSortedBySource,
          backupList: backuplist,
        ),
      );
    } catch (e) {
      emit(
        Error(
          errorMessage: errorMessage,
          usersData: state.usersData,
          isSortedAlphabetic: state.isSortedAlphabetic,
          isSortedBySource: state.isSortedBySource,
          backUpList: state.backupList,
        ),
      );
    }
  }
}
