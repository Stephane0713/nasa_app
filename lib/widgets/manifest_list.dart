import 'package:flutter/material.dart';
import 'package:nasa_app/models/manifest_api_response.dart';
import 'package:nasa_app/screens/photos_page.dart';

class ManifestList extends StatelessWidget {
  final Manifest? manifest;
  final String rover;

  const ManifestList({Key? key, this.manifest, required this.rover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Wrap with Container
      height: MediaQuery.of(context)
          .size
          .height, // Set height to fill available space
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: manifest!.photos!.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotosPage(
                  sol: manifest!.photos![index]!.sol!,
                  rover: rover,
                ),
              ),
            ),
            title: Text("on ${manifest!.photos![index].earthDate}"),
            leading: Text("Sol ${manifest!.photos![index].sol}"),
            trailing: Text("${manifest!.photos![index].totalPhotos}"),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 2,
        ),
      ),
    );
  }
}
