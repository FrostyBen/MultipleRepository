part of 'details_bloc.dart';

class DetailsEvent {}

class GetDetails extends DetailsEvent {
  final User user;

  GetDetails({required this.user});
}
