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
      home: QuestionScreen(),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late PageController _ctrl;
  int _score = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App')),
      body: PageView.builder(
        controller: _ctrl,
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
                Text('Question ${i + 1} / ${questions.length}',
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
                            if (question.selectedOption!.isCorrect) {
                              _score++;
                            }
                          }
                        })),
                ElevatedButton(
                  onPressed: () {
                    if (i + 1 < questions.length) {
                      _ctrl.nextPage(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInExpo);
                    } else {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(score: _score)));
                    }
                  },
                  child: i + 1 < questions.length
                      ? const Text('Next')
                      : const Text('Result'),
                )
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
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option.txt, style: const TextStyle(fontSize: 20)),
            getIconForOption(option, question),
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

  Widget getIconForOption(Option option, Question question) {
    if (question.isLocked) {
      if (option == question.selectedOption) {
        return option.isCorrect
            ? const Icon(Icons.check_circle, color: Colors.green)
            : const Icon(Icons.cancel, color: Colors.red);
      } else if (option.isCorrect) {
        return const Icon(Icons.check_circle, color: Colors.green);
      }
    }
    return const SizedBox.shrink();
  }
}

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.score}) : super(key: key);
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Result')),
        body: Center(
          child: Text('you got $score out of ${questions.length}'),
        ));
  }
}
