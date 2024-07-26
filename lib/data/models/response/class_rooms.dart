class ClassRooms {
  List<Classroom> classrooms;

  ClassRooms({
    required this.classrooms,
  });

  factory ClassRooms.fromJson(Map<String, dynamic> json) => ClassRooms(
    classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
  };
}

class Classroom {
  int id;
  String layout;
  String name;
  int size;

  Classroom({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
    id: json["id"],
    layout: json["layout"],
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "layout": layout,
    "name": name,
    "size": size,
  };
}
