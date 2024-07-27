class ClassroomDetail {
  int id;
  String layout;
  String name;
  int size;
  dynamic subject;

  ClassroomDetail({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
    required this.subject,
  });

  factory ClassroomDetail.fromJson(Map<String, dynamic> json) => ClassroomDetail(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
    "subject": subject,
  };
}
