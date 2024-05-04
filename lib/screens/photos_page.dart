import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/models/photo.dart';
import 'package:nasa_app/services/photo_service.dart';

class PhotosPage extends StatefulWidget {
  PhotosPage({Key? key}) : super(key: key);

  @override
  _PhotosPageState createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<Photo?>? photos;
  late int page;

  @override
  void initState() {
    super.initState();
    page = 1;
    _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    try {
      final photosResponse =
          await PhotoService.fetchPhotos("curiosity", 1000, page);
      setState(() {
        photos = photosResponse?.photos;
      });
    } catch (e) {
      print('Error fetching mission info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: photos != null
          ? Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: photos!.length,
                    itemBuilder: (context, index) {
                      final photo = photos![index];
                      return Container(
                        key: Key(index.toString()),
                        height: 300,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Image.network(
                            photo?.imgsrc ?? "",
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() => page = page > 1 ? page - 1 : 1);
                            _fetchPhotos();
                          },
                          child: Text("Previous")),
                      Text(page.toString()),
                      TextButton(
                          onPressed: () {
                            setState(() => page = page + 1);
                            _fetchPhotos();
                          },
                          child: Text("Next")),
                    ],
                  ),
                )
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
