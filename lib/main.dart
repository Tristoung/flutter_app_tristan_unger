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
      title: 'Star Wars',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 205, 252, 255),
          ),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Je suis ton père !'),
      ),
      body: ListView(
        children: const [
          CharacterTile('Luke'),
          CharacterTile('Vador'),
          CharacterTile('Palpatine'),
          
        ],
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