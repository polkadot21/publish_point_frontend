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

    on<AllJournalsEvent>((event, emit) async {
      emit(LoadingJournalsState());

      HttpResult response = await repository.getJournals(
        event.category,
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
        emit(SuccessJournalsState(data, event.page));
      } else if (response.status == -1) {
        emit(ErrorJournalsState('Internet error'));
      } else {
        emit(ErrorJournalsState('Socket error'));
      }
    });
  }
}

