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
