class SpecListModel {
  final List<SpecData> data;

  SpecListModel({required this.data});

  SpecListModel copyWith({
    List<SpecData>? data,
  }) =>
      SpecListModel(
        data: data ?? this.data,
      );

  factory SpecListModel.fromJson(Map<String, dynamic> json) => SpecListModel(
        data: json["data"] == null
            ? []
            : List<SpecData>.from(
                json["data"].map(
                  (x) => SpecData.fromJson(x),
                ),
              ),
      );
}

class SpecData {
  final int id;
  final String name;
  final String desc;
  final int status;

  SpecData({
    required this.id,
    required this.name,
    required this.desc,
    required this.status,
  });

  SpecData copyWith({
    int? id,
    String? name,
    String? desc,
    int? status,
  }) =>
      SpecData(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        status: status ?? this.status,
      );

  factory SpecData.fromJson(Map<String, dynamic> json) => SpecData(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        desc: json["desc"] ?? '',
        status: json["status"] ?? 0,
      );
}
