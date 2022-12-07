part of 'overview_bloc.dart';

class OverviewState {}

class OverviewLoaded extends OverviewState {
  final List<User> usersData;

  OverviewLoaded({
    required this.usersData,
  });
}

class Error extends OverviewState {
  final String errorMessage;

  Error({required this.errorMessage});
}
