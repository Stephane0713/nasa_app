import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/manifest_api_response.dart';
import 'package:nasa_app/screens/photos_page.dart';

class ManifestList extends StatelessWidget {
  final Manifest? manifest;

  const ManifestList({super.key, this.manifest});

  @override
  Widget build(BuildContext context) {
    if (manifest == null) {
      return const Center(
        child: Text('No manifest data available'),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8.0),
          ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: manifest!.photos!.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PhotosPage())),
                title: Text("on ${manifest!.photos![index].earthDate}"),
                leading: Text("Sol ${manifest!.photos![index].sol}"),
                trailing: Text("${manifest!.photos![index].totalPhotos}"),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              height: 2,
            ),
          ),
          const Divider(
            height: 2,
          ),
        ],
      );
    }
  }
}
