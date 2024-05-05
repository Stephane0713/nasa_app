import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  final Function(String) onTap;

  const DrawerMenu({Key? key, required this.onTap}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<String> roverNames = [
    "curiosity", "opportunity", "spirit"
  ];

  @override
  void initState() {
    super.initState();
    // _fetchRoverNames();
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
