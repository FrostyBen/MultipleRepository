part of 'overview_bloc.dart';

class OverviewEvent {}

class GetData extends OverviewEvent {}

class AlphabeticSort extends OverviewEvent {
  final bool isSortAlphabetic;

  AlphabeticSort({required this.isSortAlphabetic});
}

class SourceSort extends OverviewEvent {
  final bool isSortbysource;

  SourceSort({required this.isSortbysource});
}

class Filter extends OverviewEvent {
  final String input;

  Filter({required this.input});
}
