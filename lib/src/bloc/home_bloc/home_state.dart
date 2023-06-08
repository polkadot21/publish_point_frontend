part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class UnAuthenticated extends HomeState {
  @override
  List<Object?> get props => [];
}

/// all sport journals
class SuccessJournalsState extends HomeState {
  final JournalListModel data;
  final int page;

  SuccessJournalsState(this.data, this.page);

  @override
  List<Object?> get props => [data, page];
}

class ErrorJournalsState extends HomeState {
  final String msg;

  ErrorJournalsState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class LoadingJournalsState extends HomeState {
  @override
  List<Object?> get props => [];
}
