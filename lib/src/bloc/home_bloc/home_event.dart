part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// sport journals
class AllJournalsEvent extends HomeEvent {
  final CategoryEnum specEnum;
  final int page;
  final int sortIndex;
  final String sortType;
  final String? search;

  AllJournalsEvent(
    this.specEnum,
    this.page,
    this.sortIndex,
    this.sortType,
    this.search,
  );

  @override
  List<Object> get props => [
        specEnum,
        page,
        sortIndex,
        sortType,
      ];
}

/// change index
class ChangeIndexEvent extends HomeEvent {
  final String type;
  final int index;

  ChangeIndexEvent(
    this.type,
    this.index,
  );

  @override
  List<Object> get props => [
        type,
        index,
      ];
}

/// show dropdown dialog
class ChangeStatusEvent extends HomeEvent {
  final bool status;
  final String type;

  ChangeStatusEvent(this.status, this.type);

  @override
  List<Object> get props => [status, type];
}
