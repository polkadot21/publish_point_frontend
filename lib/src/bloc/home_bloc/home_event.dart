part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// journals
class AllJournalsEvent extends HomeEvent {
  final Category category;
  final int page;
  final int perPage;
  final String? sortByPrice;
  final String? sortByNextIssueDate;
  final String? sortByNextIssueDeadline;
  final String? sortByAccept;
  final String? sortByGeneral;
  final String? search;

  AllJournalsEvent(
    this.category,
    this.page,
    this.perPage,
    this.sortByPrice,
    this.sortByNextIssueDate,
    this.sortByNextIssueDeadline,
    this.sortByAccept,
    this.sortByGeneral,
    this.search,
  );

  @override
  List<Object> get props => [
        category,
        page,
        perPage,
        sortByPrice,
        sortByNextIssueDate,
        sortByNextIssueDeadline,
        sortByAccept,
        sortByGeneral,
        search
      ];
}

