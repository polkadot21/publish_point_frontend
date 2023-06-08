class JournalListModel {
  final bool next;
  final List<JournalData> data;

  JournalListModel({
    required this.next,
    required this.data,
  });

  JournalListModel copyWith({
    bool? next,
    List<JournalData>? data,
  }) =>
      JournalListModel(
        next: next ?? this.next,
        data: data ?? this.data,
      );

  factory JournalListModel.fromJson(Map<String, dynamic> json) =>
      JournalListModel(
        next: json["next"] ?? false,
        data: json["data"] == null
            ? []
            : List<JournalData>.from(
                json["data"].map(
                  (x) => JournalData.fromJson(x),
                ),
              ),
      );
}

class JournalData {
  final String id;
  final String name;
  final String descriptionInfo;
  final String submitPaperLink;
  final int pricePerPaper;
  final String nextIssueDate;
  final String nextIssueDeadline;
  final int acceptedPerc;
  final String acceptedPercUnits;
  final int generalScore;
  final String generalScoreUnits;

  JournalData({
    required this.id,
    required this.name,
    required this.descriptionInfo,
    required this.submitPaperLink,
    required this.pricePerPaper,
    required this.nextIssueDate,
    required this.nextIssueDeadline,
    required this.acceptedPerc,
    required this.acceptedPercUnits,
    required this.generalScore,
    required this.generalScoreUnits,
  });

  JournalData copyWith({
    String? id,
    String? name,
    String? descriptionInfo,
    String? submitPaperLink,
    int? pricePerPaper,
    String? nextIssueDate,
    String? nextIssueDeadline,
    int? acceptedPerc,
    String? acceptedPercUnits,
    int? generalScore,
    String? generalScoreUnits,
  }) =>
      JournalData(
        id: id ?? this.id,
        name: name ?? this.name,
        descriptionInfo: descriptionInfo ?? this.descriptionInfo,
        submitPaperLink: submitPaperLink ?? this.submitPaperLink,
        pricePerPaper: pricePerPaper ?? this.pricePerPaper,
        nextIssueDate: nextIssueDate ?? this.nextIssueDate,
        nextIssueDeadline: nextIssueDeadline ?? this.nextIssueDeadline,
        acceptedPerc: acceptedPerc ?? this.acceptedPerc,
        acceptedPercUnits: acceptedPercUnits ?? this.acceptedPercUnits,
        generalScore: generalScore ?? this.generalScore,
        generalScoreUnits: generalScoreUnits ?? this.generalScoreUnits,
      );

  factory JournalData.fromJson(Map<String, dynamic> json) => JournalData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        descriptionInfo: json["description_info"] ?? '',
        submitPaperLink: json["submit_paper_link"] ?? '',
        pricePerPaper: json["price_per_paper"] ?? 0,
        nextIssueDate: json["next_issue_date"] ?? '',
        nextIssueDeadline: json["next_issue_deadline"] ?? '',
        acceptedPerc: json["accepted_perc"] ?? 0,
        acceptedPercUnits: json["accepted_perc_units"] ?? '',
        generalScore: json["general_score"] ?? 0,
        generalScoreUnits: json["general_score_units"] ?? '',
      );
}
