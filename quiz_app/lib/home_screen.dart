import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/quiz.png'),
            const SizedBox(height: 150),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200,60),
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.deepOrangeAccent,
                foregroundColor: Colors.white
              ),
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const QuizScreen()
                    )
                  );
                },
                child: const Text('Start Quiz')
            )
          ],
        ),
    );
  }
}
