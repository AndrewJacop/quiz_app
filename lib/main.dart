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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: questions.length,
        itemBuilder: (context, i) {
          final question = questions[i];
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 5),
                Text('Question $i / ${questions.length}',
                    style: const TextStyle(fontSize: 30)),
                const Divider(thickness: 3),
                Text(question.txt, style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 5),
                Expanded(
                    child: OptionWidget(
                        question: question,
                        onClickedOption: (option) {
                          if (question.isLocked) {
                            return;
                          } else {
                            setState(() {
                              question.isLocked = true;
                              question.selectedOption = option;
                            });
                          }
                        }))
              ],
            ),
          );
        },
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;
  const OptionWidget(
      {Key? key, required this.question, required this.onClickedOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: question.options
          .map((option) => buildOption(context, option))
          .toList(),
    );
  }

  Widget buildOption(BuildContext context, Option option) {
    final borderColor = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        height: 50,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(option.txt, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }

  Color getColorForOption(Option option, Question question) {
    if (question.isLocked) {
      if (option == question.selectedOption) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey;
  }
}
