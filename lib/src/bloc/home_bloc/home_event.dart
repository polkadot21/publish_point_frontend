part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// sport journals
class AllSportJournalsEvent extends HomeEvent {
  final int page;
  final int perPage;
  final String? sortByPrice;
  final String? sortByNextIssueDate;
  final String? sortByNextIssueDeadline;
  final String? sortByAccept;
  final String? sortByGeneral;

  AllSportJournalsEvent(
    this.page,
    this.perPage,
    this.sortByPrice,
    this.sortByNextIssueDate,
    this.sortByNextIssueDeadline,
    this.sortByAccept,
    this.sortByGeneral,
  );

  @override
  List<Object> get props => [
        page,
        perPage,
      ];
}

/// info journals
class AllInfoJournalsEvent extends HomeEvent {
  final int page;
  final int perPage;
  final String? sortByPrice;
  final String? sortByNextIssueDate;
  final String? sortByNextIssueDeadline;
  final String? sortByAccept;
  final String? sortByGeneral;

  AllInfoJournalsEvent(
    this.page,
    this.perPage,
    this.sortByPrice,
    this.sortByNextIssueDate,
    this.sortByNextIssueDeadline,
    this.sortByAccept,
    this.sortByGeneral,
  );

  @override
  List<Object> get props => [
        page,
        perPage,
      ];
}
