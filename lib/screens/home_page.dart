import 'package:flutter/material.dart';
import '../models/info_mission.dart';
import '../widgets/mission_card.dart';
import '../services/mission_service.dart';

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
    _fetchMissionInfo();
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
