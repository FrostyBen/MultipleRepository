part of 'overview_bloc.dart';

class OverviewState {
  final List<User> usersData;
  final bool isSortedAlphabetic;
  final bool isSortedBySource;
  OverviewState(
      {required this.isSortedBySource,
      required this.isSortedAlphabetic,
      required this.usersData});
}

class Error extends OverviewState {
  final String errorMessage;

  Error({
    required this.errorMessage,
    required List<User> usersData,
    required bool isSortedAlphabetic,
    required bool isSortedBySource,
  }) : super(
            usersData: usersData,
            isSortedAlphabetic: isSortedAlphabetic,
            isSortedBySource: isSortedBySource);
}

class Loading extends OverviewState {
  Loading(
      {required super.isSortedAlphabetic,
      required super.usersData,
      required super.isSortedBySource});
}
