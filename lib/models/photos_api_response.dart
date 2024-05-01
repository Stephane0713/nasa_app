import 'package:nasa_app/models/photo.dart';

class PhotosApiResponse {
  List<Photo?>? photos;

  PhotosApiResponse({this.photos});

  PhotosApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photo>[];
      json['photos'].forEach((v) {
        photos!.add(Photo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['photos'] =
        photos != null ? photos!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}
