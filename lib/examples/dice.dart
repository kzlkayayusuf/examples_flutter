import 'dart:math';

import 'package:flutter/material.dart';

class DiceApp extends StatelessWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body:  DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber=1;
  int rightDiceNumber=1;

  void randomNumber(){
    setState(() {
      leftDiceNumber= Random().nextInt(6) + 1;
      rightDiceNumber= Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(onPressed: () {
              randomNumber();
            },
            child: Image.asset('assets/images/dice_$leftDiceNumber.png')),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                randomNumber();
              },
              child: Image(
                image: AssetImage('assets/images/dice_$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
