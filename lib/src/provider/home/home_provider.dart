import 'package:publishpoint/src/model/http_result.dart';
import 'package:publishpoint/src/provider/api_provider.dart';

enum Category { sportScience, computerScience, psychology }

class HomeProvider extends ApiProvider {

  /// get journals
  Future<HttpResult> getJournals(
    Category category,
    int page,
    int perPage,
    String? sortByPrice,
    String? sortByNextIssueDate,
    String? sortByNextIssueDeadline,
    String? sortByAccept,
    String? sortByGeneral,
    String? search,
  ) async {
    String params = 'by_price_per_page=asc';

    String mainParam = 'page=$page&per_page=$perPage&';

    if (sortByPrice != null) {
      params = 'by_price_per_page=$sortByPrice';
    } else if (sortByNextIssueDate != null) {
      params = 'by_next_issue_date=$sortByNextIssueDate';
    } else if (sortByNextIssueDeadline != null) {
      params = 'by_next_issue_deadline=$sortByNextIssueDeadline';
    } else if (sortByAccept != null) {
      params = 'by_accepted_perc=$sortByAccept';
    } else if (sortByGeneral != null) {
      params = 'by_general_score=$sortByGeneral';
    } else if (search != null) {
      params += '&search=$search';
    }

    params = mainParam + params;

    String url = "${baseUrl}/journals/${categoryToString(category)}?$params";

    return get(url);
  }

  // Map Category enum to string
  String categoryToString(Category category) {
    switch(category) {
      case Category.sportScience:
        return 'sport-science';
      case Category.computerScience:
        return 'computer-science';
      case Category.psychology:
        return 'psychology';
      default:
        throw ArgumentError('Invalid Category');
    }
  }
}

