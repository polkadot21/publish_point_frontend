import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:publishpoint/src/model/api/journal_list_model.dart';
import 'package:publishpoint/src/model/api/category_enum.dart';
import 'package:publishpoint/src/model/http_result.dart';
import 'package:publishpoint/src/repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RepositoryHome repository;

  HomeBloc({required this.repository}) : super(UnAuthenticated()) {
    /// journals
    on<AllJournalsEvent>((event, emit) async {
      emit(LoadingJournalsState());

      String? sortByPrice,
          sortByNextIssueDate,
          sortByNextIssueDeadline,
          sortByAccept,
          sortByGeneral;
      switch (event.sortIndex) {
        case 0:
          sortByPrice = event.sortType;
          break;
        case 1:
          sortByNextIssueDate = event.sortType;
          break;
        case 2:
          sortByNextIssueDeadline = event.sortType;
          break;
        case 3:
          sortByAccept = event.sortType;
          break;
        case 4:
          sortByGeneral = event.sortType;
          break;
        default:
          '';
      }
      HttpResult response = await repository.getJournals(
        event.specEnum,
        event.page,
        sortByPrice,
        sortByNextIssueDate,
        sortByNextIssueDeadline,
        sortByAccept,
        sortByGeneral,
        event.search,
      );
      if (response.isSuccess) {
        JournalListModel data = JournalListModel.fromJson(
          response.result,
        );
        emit(SuccessJournalsState(data, event.page));
      } else if (response.status == -1) {
        emit(ErrorJournalsState('Utils.errorMessage(response)'));
      } else {
        emit(ErrorJournalsState('Utils.errorMessage(response)'));
      }
    });
  }
}
