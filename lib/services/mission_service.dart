import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_key.dart' as myApiKey;
import '../models/info_mission.dart';

class MissionService {
  static Future<InfoMission?> fetchMissionInfo() async {
    final apiUrl = Uri.https('api.nasa.gov', '/mars-photos/api/v1/rovers/curiosity', {
      'api_key': myApiKey.apiKey,
    });

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return InfoMission.fromJson(responseData);
    } else {
      throw Exception('Failed to load mission info');
    }
  }
}
