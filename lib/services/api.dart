import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:study_club/models/method.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load album');
  }
}

Future<List<Album>> getData() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body) as List;
    return jsonResponse.map((data) => Album.fromJson(data)).toList();
  } else {
    return throw Exception('Failed to load album');
  }
}
