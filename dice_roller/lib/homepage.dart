import 'dart:math';

import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int diceOne = -1;
  int diceTwo = -1;
  bool isReady = false;

  Widget buildDiceCard(String title,int index){
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              title,
            style: const TextStyle(
                fontSize: 22,
                decoration: TextDecoration.underline
            ),
          ),
          const SizedBox(height: 48),
          isReady ?  Image.asset('assets/dices/$index.png')
              :
          Container(
              height: 150,
              alignment: Alignment.center,
              color: Colors.deepOrange,
              child: const Text('Dice')
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
                'Dice Roller',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: buildDiceCard('Player 1',diceOne)),
                Expanded(child: buildDiceCard('Player 2',diceTwo))
              ],
            ),
            if(isReady)
              Text(
                  diceOne != diceTwo ?
                    diceOne > diceTwo ? 'Player 1 is Winner' : 'Player 2 is Winner'
                      : 'Draw'
              ),
            ElevatedButton(
                onPressed: (){
                    Random random = Random();
                    int randOne = random.nextInt(6) + 1;
                    int randTwo = random.nextInt(6) + 1;
                    setState(() {
                        diceOne = randOne;
                        diceTwo = randTwo;
                        isReady = true;
                    });

                },
                child: const Text('Roll Dices',style: TextStyle(fontSize: 24))
            )
          ],
        ),
      ),
    );
  }
}
