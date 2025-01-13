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
  final _names = [
    'Property in Egypt',
    'John Pork',
    'Chopped Chin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
      title: Text(name),
    );
  }
}