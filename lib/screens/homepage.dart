import 'package:flutter/material.dart';
import 'package:study_club/services/api.dart';
import 'package:study_club/models/method.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Album> futureAlbum;
  String dummuy = '';

  @override
  void initState() {
    futureAlbum = fetchAlbum();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data!.title),
              Image.network(snapshot.data!.url),
            ],
          ));
        } else if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
