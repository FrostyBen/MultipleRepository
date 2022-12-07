part of 'details_bloc.dart';

class DetailsState {}

class DetailsLoaded extends DetailsState {
  final User user;

  DetailsLoaded({required this.user});
}

class Error extends DetailsState {
  final String errormessage;

  Error({required this.errormessage});
}
