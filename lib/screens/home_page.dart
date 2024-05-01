import 'package:flutter/material.dart';
import 'package:nasa_app/models/manifest_api_response.dart';
import 'package:nasa_app/services/manifest_service.dart';
import 'package:nasa_app/widgets/drawer_menu.dart';
import 'package:nasa_app/widgets/manifest_list.dart';
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
  Manifest? manifest;

  @override
  void initState() {
    super.initState();
    _fetchMissionInfo();
    _fetchManifest();
  }

  Future<void> _fetchMissionInfo() async {
    try {
      final missionInfo = await MissionService.fetchMissionInfoForAllRovers();
      setState(() {
        infoMission = missionInfo.first;
      });
    } catch (e) {
      print('Error fetching mission info: $e');
    }
  }

  Future<void> _fetchManifest() async {
    try {
      final manifestApiResponse = await ManifestService.fetchManifest();
      setState(() {
        manifest = manifestApiResponse!.manifest;
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
              ManifestList(
                manifest: manifest,
              )
            ],
          ),
        ),
        drawer: DrawerMenu(onTap: (roverName) {
          print('Rover name: $roverName');
        }));
  }
}
