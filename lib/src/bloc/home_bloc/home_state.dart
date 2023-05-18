part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class UnAuthenticated extends HomeState {
  @override
  List<Object?> get props => [];
}

/// all sport journals
class SuccessSportJournalsState extends HomeState {
  final JournalListModel data;
  final int page;

  SuccessSportJournalsState(this.data, this.page);

  @override
  List<Object?> get props => [data, page];
}

class ErrorSportJournalsState extends HomeState {
  final String msg;

  ErrorSportJournalsState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class LoadingSportJournalsState extends HomeState {
  @override
  List<Object?> get props => [];
}

/// all journals
class SuccessInfoJournalsState extends HomeState {
  final JournalListModel data;
  final int page;

  SuccessInfoJournalsState(this.data, this.page);

  @override
  List<Object?> get props => [data, page];
}

class ErrorInfoJournalsState extends HomeState {
  final String msg;

  ErrorInfoJournalsState(this.msg);

  @override
  List<Object?> get props => [msg];
}

class LoadingInfoJournalsState extends HomeState {
  @override
  List<Object?> get props => [];
}