import 'package:http/http.dart' as http;
import 'package:nasa_app/models/manifest_api_response.dart';
import 'dart:convert';
import 'package:nasa_app/utils/api_key.dart' as myApiKey;

class ManifestService {
  static Future<ManifestApiResponse?> fetchManifest() async {
    final apiUrl = Uri.https('api.nasa.gov',
        '/mars-photos/api/v1/manifests/spirit', {'api_key': myApiKey.apiKey});

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return ManifestApiResponse.fromJson(responseData);
    } else {
      throw Exception('Failed to load mission info');
    }
  }
}
