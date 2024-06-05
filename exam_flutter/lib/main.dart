import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TASC App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Place>> places;

  Future<List<Place>> fetchPlaces() async {
    final response = await http.get(Uri.parse(
        'http://localhost:8080/api/getPlaces')); // Use 10.0.2.2 for Android emulator

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  void initState() {
    super.initState();
    places = fetchPlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Destinations'),
      ),
      body: FutureBuilder<List<Place>>(
        future: places,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No places found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Place place = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: Image.network(place.imageUrl),
                    title: Text(place.name),
                    subtitle: Text(place.description),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}