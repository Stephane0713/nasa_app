import 'package:nasa_app/models/photo.dart';

class ManifestPhotoInfo {
  int? sol;
  String? earthDate;
  int? totalPhotos;
  List<String>? cameras;

  ManifestPhotoInfo({this.sol, this.earthDate, this.totalPhotos, this.cameras});

  ManifestPhotoInfo.fromJson(Map<String, dynamic> json) {
    sol = json['sol'];
    earthDate = json['earth_date'];
    totalPhotos = json['total_photos'];
    if (json['cameras'] != null) {
      cameras = <String>[];
      json['cameras'].forEach((v) {
        cameras!.add(v.toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['sol'] = sol;
    data['earth_date'] = earthDate; // Correct variable name
    data['total_photos'] = totalPhotos; // Correct variable name
    data['cameras'] = cameras;
    return data;
  }
}

class Manifest {
  String? name;
  String? landingdate;
  String? launchdate;
  String? status;
  int? maxsol;
  String? maxdate;
  int? totalphotos;
  List<ManifestPhotoInfo>? photos;

  Manifest({
    this.name,
    this.landingdate,
    this.launchdate,
    this.status,
    this.maxsol,
    this.maxdate,
    this.totalphotos,
    this.photos,
  });

  Manifest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    landingdate = json['landing_date'];
    launchdate = json['launch_date'];
    status = json['status'];
    maxsol = json['max_sol'];
    maxdate = json['max_date'];
    totalphotos = json['total_photos'];
    photos = List<ManifestPhotoInfo>.from(
        (json['photos'] ?? []).map((x) => ManifestPhotoInfo.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['landing_date'] = landingdate;
    data['launch_date'] = launchdate;
    data['status'] = status;
    data['max_sol'] = maxsol;
    data['max_date'] = maxdate;
    data['total_photos'] = totalphotos;
    data['photos'] = photos?.map((x) => x.toJson()).toList();
    return data;
  }
}

class ManifestApiResponse {
  Manifest? manifest;

  ManifestApiResponse({this.manifest});

  ManifestApiResponse.fromJson(Map<String, dynamic> json) {
    manifest = json['photo_manifest'] != null
        ? Manifest.fromJson(json['photo_manifest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['photo_manifest'] = manifest?.toJson();
    return data;
  }
}
