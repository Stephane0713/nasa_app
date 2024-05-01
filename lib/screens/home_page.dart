import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/api_key.dart' as myApiKey;
import '../models/info_mission.dart';
import '../widgets/mission_card.dart';
import '../services/mission_service.dart'; // Import the MissionService

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InfoMission? infoMission;

  @override
  void initState() {
    super.initState();
    _fetchMissionInfo(); // Changed to call the function from the separate file
  }

  Future<void> _fetchMissionInfo() async {
    try {
      final missionInfo = await MissionService.fetchMissionInfo();
      setState(() {
        infoMission = missionInfo;
      });
    } catch (e) {
      print('Error fetching mission info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mars Rover'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MissionCard(infoMission: infoMission),
          ],
        ),
      ),
    );
  }
}
