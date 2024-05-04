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
}
