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
  String currentRover = "curiosity";
  InfoMission? infoMission;
  Manifest? manifest;

  @override
  void initState() {
    super.initState();
    _fetchMissionAndManifest();
  }

  Future<void> _fetchMissionAndManifest() async {
    try {
      final missionInfo = await MissionService.fetchMission(currentRover);
      final manifestApiResponse =
          await ManifestService.fetchManifest(currentRover);

      setState(() {
        infoMission = missionInfo;
        manifest = manifestApiResponse?.manifest;
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
        body: infoMission != null && manifest != null
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    MissionCard(infoMission: infoMission),
                    ManifestList(
                      rover: currentRover,
                      manifest: manifest,
                    )
                  ],
                ))
            : const Center(
                child: CircularProgressIndicator(),
              ),
        drawer: DrawerMenu(onTap: (roverName) {
          setState(() {
            currentRover = roverName;
            manifest = null;
            infoMission = null;
          });
          _fetchMissionAndManifest();
          Navigator.pop(context);
        }));
  }
}
