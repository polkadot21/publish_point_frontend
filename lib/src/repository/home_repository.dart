import 'package:publishpoint/src/model/api/category_enum.dart';
import 'package:publishpoint/src/model/http_result.dart';
import 'package:publishpoint/src/provider/home/home_provider.dart';

abstract class RepositoryHome {
  Future<HttpResult> getJournals(
    CategoryEnum category,
    int page,
    String? sortByPrice,
    String? sortByNextIssueDate,
    String? sortByNextIssueDeadline,
    String? sortByAccept,
    String? sortByGeneral,
    String? search,
  );
}

class HomeRepository implements RepositoryHome {
  HomeProvider homeProvider = HomeProvider();

  @override
  Future<HttpResult> getJournals(
    CategoryEnum category,
    int page,
    String? sortByPrice,
    String? sortByNextIssueDate,
    String? sortByNextIssueDeadline,
    String? sortByAccept,
    String? sortByGeneral,
    String? search,
  ) {
    return homeProvider.getJournals(
      category,
      page,
      sortByPrice,
      sortByNextIssueDate,
      sortByNextIssueDeadline,
      sortByAccept,
      sortByGeneral,
      search,
    );
  }
}
