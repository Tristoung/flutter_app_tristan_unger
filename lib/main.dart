import 'package:flutter/material.dart';

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

class BrainrotService {
  Future<List<String>> fetchBrainrot() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    return [
      'Snailminem',
      'Red apple dog',
      'Quandale Dingle',
      'The eye of Rah',
    ];
  }
}

// final _names = [
//     'Property in Egypt',
//     'John Pork',
//     'Chopped Chin',
//     'The Rizzler'
//   ];