import 'package:nasa_app/models/camera.dart';

class Rover {
  int? id;
  String? name;
  String? landingdate;
  String? launchdate;
  String? status;
  int? maxsol;
  String? maxdate;
  int? totalphotos;
  List<Camera?>? cameras;

  Rover(
      {this.id,
      this.name,
      this.landingdate,
      this.launchdate,
      this.status,
      this.maxsol,
      this.maxdate,
      this.totalphotos,
      this.cameras});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingdate = json['landing_date'];
    launchdate = json['launch_date'];
    status = json['status'];
    maxsol = json['max_sol'];
    maxdate = json['max_date'];
    totalphotos = json['total_photos'];
    if (json['cameras'] != null) {
      cameras = <Camera>[];
      json['cameras'].forEach((v) {
        cameras!.add(Camera.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['landing_date'] = landingdate;
    data['launch_date'] = launchdate;
    data['status'] = status;
    data['max_sol'] = maxsol;
    data['max_date'] = maxdate;
    data['total_photos'] = totalphotos;
    data['cameras'] =
        cameras != null ? cameras!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
