import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_key.dart' as myApiKey;
import '../models/info_mission.dart';

class MissionService {
  static const List<String> roverNames = [
    'curiosity',
    'opportunity',
    'spirit'
  ]; // Liste des noms de tous les rovers

  static Future<List<InfoMission>> fetchMissionInfoForAllRovers() async {
    List<InfoMission> missions = [];
    for (String roverName in roverNames) {
      final apiUrl = Uri.https(
        'api.nasa.gov',
        '/mars-photos/api/v1/rovers/$roverName',
        {'api_key': myApiKey.apiKey},
      );

      final response = await http.get(apiUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final missionInfo = InfoMission.fromJson(responseData);
        missions.add(missionInfo);
      } else {
        throw Exception('Failed to load mission info for $roverName');
      }
    }
    return missions;
  }
}
