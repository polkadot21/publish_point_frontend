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

/// change index
class ChangeIndexState extends HomeState {
  final String type;
  final int index;

  ChangeIndexState(this.type, this.index);

  @override
  List<Object?> get props => [type, index];
}

/// show dropdown dialog
class ChangeStatusState extends HomeState {
  final bool status;
  final String type;

  ChangeStatusState(this.status, this.type);

  @override
  List<Object?> get props => [status, type];
}
