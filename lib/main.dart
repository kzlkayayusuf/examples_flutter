import 'package:flutter/material.dart';
import 'package:test_app/examples/dice.dart';
import 'package:test_app/examples/person_card.dart';
import 'package:test_app/examples/quiz.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quizzler(),
    ),
  );
  /*MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text(
            'I am Rich!',
            textAlign: TextAlign.center,
          ),
        ),
        body:const Center(
          child: Image(
            image:  AssetImage('assets/images/ironman.jpg'),
          ),
        ),
      ),
    ),
  );*/
}


