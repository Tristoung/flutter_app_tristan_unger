import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brainrot List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 205, 245, 255),
          ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _service = BrainrotService();
  List<String> _names = [];

  @override
  void initState() {
    super.initState();
    _service.fetchBrainrot().then((names) {
      setState(() {
        _names = names;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        title: const Text('Brainrot List'),
      ),
      body: ListView.builder(
        itemCount: _names.length,
        itemBuilder: (BuildContext context, int index) => CharacterTile(
          _names[index],
        ),
      ),
    );
  }
}

class CharacterTile extends StatelessWidget {
  const CharacterTile(this.name);

  final String name;
  @override
  Widget build (BuildContext context) {
    return ListTile(
      titleTextStyle: TextStyle(fontSize: 15, color: Colors.black),
      title: Text(name),
    );
  }
}

const apiLink = 'https://www.swapi.tech/api/';

class BrainrotService {


  Future<List<String>> fetchBrainrot() async {
    await Future.delayed(
      Duration(seconds: 3),
    );

    final response = await http.get(Uri.parse('${apiLink}people'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json is Map<String, dynamic>) {
        return _parseCharacters(json).map((e) => e.name).toList();
      }
    }
    return[];
  }
  List<BasicCharacterData> _parseCharacters(Map<String, dynamic> json) {
    final results = json['results'];
    if (results is List<dynamic>) {
      return results
      .map(
        (json) => BasicCharacterData.fromJson(json as Map<String, dynamic>),
        )
        .toList();
    } else {
      return [];
    }
  }
  // Future<String> fetchMoreBrainrot() async {
  //   await Future.delayed(
  //     Duration(seconds: 1),
  //   );
  //   if(_names.isNotEmpty) {
  //     String nameToSend = _names.removeLast();
  //     return nameToSend;
  //   }
  //   return "";
  // }
}

class BasicCharacterData {
  final String id;
  final String name;

  BasicCharacterData({
    required this.id,
    required this.name,
  });

  BasicCharacterData.fromJson(Map<String, dynamic> json)
    : id = json['uid'],
      name = json['name'];
}

// return [
//   'Snailminem',
//   'Red apple dog',
//   'Quandale Dingle',
//   'The eye of Rah',
// ];

// final _names = [
//   'Property in Egypt',
//   'John Pork',
//   'Chopped Chin',
//   'The Rizzler'
// ];