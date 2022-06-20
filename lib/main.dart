import 'package:flutter/material.dart';
import 'package:quiz_app/model.dart';

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
        physics: NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, i) {
          final _question = questions[i];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Text('Question $i / ${questions.length}',
                    style: const TextStyle(fontSize: 30)),
                const Divider(thickness: 3),
                Text(_question.txt, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 5),
                Expanded(child: OptWdg(question: _question))
              ],
            ),
          );
        },
      ),
    );
  }
}

class OptWdg extends StatelessWidget {
  final Question question;
  const OptWdg({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          question.options.map((option) => bldOpt(context, option)).toList(),
    );
  }
}

Widget bldOpt(BuildContext context, Option option) {
  return GestureDetector(
    onTap: () => onClickOption(option),
    child: Container(
      height: 50,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Text(option.opt, style: TextStyle(fontSize: 20)),
        ],
      ),
    ),
  );
}

onClickOption(Option option) {}
