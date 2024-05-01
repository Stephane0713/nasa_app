import 'package:flutter/material.dart';
import 'package:nasa_app/services/mission_service.dart';

class DrawerMenu extends StatefulWidget {
  final Function(String) onTap;

  const DrawerMenu({Key? key, required this.onTap}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<String> roverNames = [];

  @override
  void initState() {
    super.initState();
    _fetchRoverNames();
  }

  Future<void> _fetchRoverNames() async {
    try {
      final missions = await MissionService.fetchMissionInfoForAllRovers();
      setState(() {
        roverNames = missions.map((mission) => mission.roverName).toList();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Icon(
                  Icons.rocket,
                  size: 40,
                  color: Colors.pink,
                ),
                Text(
                  "Mars Rover",
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: roverNames.length,
              itemBuilder: (context, index) {
                final roverName = roverNames[index];
                return ListTile(
                  title: Text(
                    roverName,
                    style: const TextStyle(fontSize: 24),
                  ),
                  onTap: () => widget.onTap(roverName),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
