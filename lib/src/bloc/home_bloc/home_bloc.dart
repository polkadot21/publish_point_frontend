import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/model/http_result.dart';
import 'package:publishpoint/src/repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepositoryHome repository;

  HomeBloc({required this.repository}) : super(UnAuthenticated()) {
    /// sport journals
    on<AllSportJournalsEvent>((event, emit) async {
      emit(LoadingSportJournalsState());

      HttpResult response = await repository.getJournals(
        true,
        event.page,
        event.perPage,
        event.sortByPrice,
        event.sortByNextIssueDate,
        event.sortByNextIssueDeadline,
        event.sortByAccept,
        event.sortByGeneral,
        event.search,
      );
      if (response.isSuccess) {
        JournalListModel data = JournalListModel.fromJson(
          response.result,
        );
        emit(SuccessSportJournalsState(data, event.page));
      } else if (response.status == -1) {
        emit(ErrorSportJournalsState('Utils.errorMessage(response)'));
      } else {
        emit(ErrorSportJournalsState('Utils.errorMessage(response)'));
      }
    });

    /// info journals

    on<AllInfoJournalsEvent>((event, emit) async {
      emit(LoadingInfoJournalsState());

      HttpResult response = await repository.getJournals(
        false,
        event.page,
        event.perPage,
        event.sortByPrice,
        event.sortByNextIssueDate,
        event.sortByNextIssueDeadline,
        event.sortByAccept,
        event.sortByGeneral,
        event.search,
      );
      if (response.isSuccess) {
        JournalListModel data = JournalListModel.fromJson(
          response.result,
        );
        emit(SuccessInfoJournalsState(data, event.page));
      } else if (response.status == -1) {
        emit(ErrorInfoJournalsState('Internet error'));
      } else {
        emit(ErrorInfoJournalsState('Socket error'));
      }
    });
  }
}
