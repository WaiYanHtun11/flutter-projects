import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Quiz> quizzes = [];
  List<String> answers = [];
  List<String> userAnswers = [];
  int index = 0;
  String? selectedAnswer;
  bool isFinished = false;

  void initData(){
      quizzes = quizData;
      for(Quiz quiz in quizzes){
          answers.add(quiz.options.first);
          int currentQuizIndex = quizzes.indexOf(quiz);
          quizzes[currentQuizIndex].options.shuffle();
      }
  }
  int getCorrectCount(){
    int count = 0;
    for(int i = 0 ; i < 10 ; i++){
      if(userAnswers[i] == answers[i]) count++;
    }
    return count;
  }

  @override
  void initState() {
    // TODO: implement initState
    initData();
    super.initState();
  }
  Widget buildAnswerOptions(List<String> options){
    return AnimatedContainer(
      curve: Curves.bounceInOut,
      duration: const Duration(milliseconds: 800),
      child: Column(
        children: List.generate(
            options.length, 
                (index) => buildOption(options[index])
        ),
      ),
    );
  }
  Widget buildOption(String option){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: (){ setState(()=> selectedAnswer = option);},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: selectedAnswer == option ? Colors.deepOrangeAccent : Colors.grey,
              width: 2
            ),
            borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Radio<String>(
                value: option,
                groupValue: selectedAnswer,
                onChanged: (String? newValue){
                  setState(() {
                    selectedAnswer = newValue;
                  });
                },
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: Text(
                    option,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildResultOption(String option,int idx){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: null,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: userAnswers[idx] == option ?
                  userAnswers[idx] == answers[idx] ? Colors.green : Colors.deepOrangeAccent
                  : Colors.grey,
                  width: 2
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Radio<String>(
                value: option,
                activeColor: userAnswers[idx] == answers[idx] ?
                            Colors.green : Colors.deepOrangeAccent,
                groupValue: userAnswers[idx] == option ? option : '',
                onChanged: (_){},
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: Text(
                    option,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 18),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNextButton(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 24),
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 18),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))
            )
          ),
          onPressed: isFinished ? (){
            setState(() {
              userAnswers.clear();
              index = 0;
              isFinished = false;
            });
          }: selectedAnswer == null ? null : (){
            if(index > 8){
              // show result
              setState(() {
                userAnswers.add(selectedAnswer!);
                selectedAnswer = null;
                isFinished = true;
              });

            }else {
              setState(() {
                userAnswers.add(selectedAnswer!);
                selectedAnswer = null;
                index++;
              });
            }
          },
          child: Text(isFinished ? 'Take Quiz Again': index == 9 ? 'Submit Quiz' : 'Next Question'),
        ),
      ),
    );
  }
  Widget buildResult(){
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Center(child: Text('Quiz Result',style: TextStyle(fontSize: 24))),
          const SizedBox(height: 24),
          Center(
              child: Text(
                  'Your Answer ${getCorrectCount()} of 10 questions correctly',
                style: const TextStyle(fontSize: 18),
              )
          ),
          ListView.builder(
            padding: const EdgeInsets.all(8),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quizzes.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        quizzes[index].question,
                        style: const TextStyle(fontSize: 20)
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: List.generate(4, (optionIndex){
                        return buildResultOption(
                            quizzes[index].options[optionIndex],
                            index
                        );
                      }),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              }
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(title: const Text('Quiz Test')),
        body: isFinished ? buildResult() : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Question ${index + 1} of 10',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(value: (index + 1) / 10),
              const SizedBox(height: 24),
              Text(
                  quizzes[index].question,
                  style: const TextStyle(fontSize: 20)
              ),
              const SizedBox(height: 24),
              buildAnswerOptions(quizzes[index].options)
            ],
          ),
        ),
        bottomNavigationBar: buildNextButton(),
      ),
    );
  }
}
