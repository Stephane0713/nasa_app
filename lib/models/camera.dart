class Camera {
  int? id;
  String? name;
  int? roverid;
  String? fullname;

  Camera({this.id, this.name, this.roverid, this.fullname});

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roverid = json['rover_id'];
    fullname = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['rover_id'] = roverid;
    data['full_name'] = fullname;
    return data;
  }
}
