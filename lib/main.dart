import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: PageView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              Text('Q #', style: const TextStyle(fontSize: 20)),
              // ignore: prefer_const_constructors
              const SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text('A 1')),
              const SizedBox(height: 5),
              ElevatedButton(onPressed: () {}, child: Text('A 2')),
              const SizedBox(height: 5),
              ElevatedButton(onPressed: () {}, child: Text('A 3')),
              const SizedBox(height: 5),
              ElevatedButton(onPressed: () {}, child: Text('A 4')),
            ],
          );
        },
      ),
    );
  }
}
