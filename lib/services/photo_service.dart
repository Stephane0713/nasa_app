import 'package:http/http.dart' as http;
import 'package:nasa_app/models/photos_api_response.dart';
import 'dart:convert';
import 'package:nasa_app/utils/api_key.dart' as myApiKey;

class PhotoService {
  static Future<PhotosApiResponse?> fetchPhotos(
      String rover, int sol, int page) async {
    final apiUrl = Uri.https(
        'api.nasa.gov', '/mars-photos/api/v1/rovers/$rover/photos', {
      'api_key': myApiKey.apiKey,
      'sol': sol.toString(),
      'page': page.toString()
    });

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return PhotosApiResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to load mission info');
    }
  }
}
