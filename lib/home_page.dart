import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_key.dart'
    as myApiKey; // Rename the import prefix 'apiKey' to 'myApiKey'
import 'info_mission.dart';

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
    fetchMissionInfo();
  }

  Future<void> fetchMissionInfo() async {
    final apiUrl =
        Uri.https('api.nasa.gov', '/mars-photos/api/v1/rovers/curiosity', {
      'api_key': myApiKey.apiKey,
    });

    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        infoMission = InfoMission.fromJson(responseData);
      });
    } else {
      throw Exception('Failed to load mission info');
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
            Card(
              color: Color.fromARGB(255, 208, 208, 208),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      '${infoMission?.roverName}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Utiliser un widget Row pour aligner les informations à gauche et à droite
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Landing Date:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${infoMission?.landingDate ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Launch Date:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${infoMission?.launchDate ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Mission Status:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${infoMission?.missionStatus ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Max Sol:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${infoMission?.maxSol ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Max Date:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${infoMission?.maxDate ?? ''}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total Photos:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text('${infoMission?.totalPhotos ?? ''}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
