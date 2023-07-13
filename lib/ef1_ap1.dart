import 'dart:math';

import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var color = Colors.green[200];
  final random = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "◉◉◉◉◉◉◉◉",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: color),
        ),
        ElevatedButton(
          onPressed: (() {
            setState(
              () {
                switch (random.nextInt(9)) {
                  case 0:
                    color = Colors.blue;
                    break;
                  case 1:
                    color = Colors.amber;
                    break;
                  case 2:
                    color = Colors.cyan;
                    break;
                  case 3:
                    color = Colors.white;
                    break;
                  case 4:
                    color = Colors.pink;
                    break;
                  case 5:
                    color = Colors.orangeAccent;
                    break;
                  case 6:
                    color = Colors.indigo;
                    break;
                  case 7:
                    color = Colors.lime;
                    break;
                  case 8:
                    color = Colors.grey;
                    break;
                }
              },
            );
          }),
          child: const SizedBox(
            width: 300,
            height: 70,
            child: Center(
              child: Text(
                'Gere uma cor aleatória 😀',
                textScaleFactor: 1.4,
              ),
            ),
          ),
        )
      ],
    );
  }
}
