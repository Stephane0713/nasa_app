import 'package:nasa_app/models/camera.dart';
import 'package:nasa_app/models/rover.dart';

class Photo {
  int? id;
  int? sol;
  Camera? camera;
  String? imgsrc;
  String? earthdate;
  Rover? rover;

  Photo(
      {this.id,
      this.sol,
      this.camera,
      this.imgsrc,
      this.earthdate,
      this.rover});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera = json['camera.dart'] != null
        ? Camera?.fromJson(json['camera.dart'])
        : null;
    imgsrc = json['img_src'];
    earthdate = json['earth_date'];
    rover = json['rover'] != null ? Rover?.fromJson(json['rover']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['sol'] = sol;
    data['camera.dart'] = camera!.toJson();
    data['img_src'] = imgsrc;
    data['earth_date'] = earthdate;
    data['rover'] = rover!.toJson();
    return data;
  }
}
