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
    return const MyWidget();
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final random = Random();

  var botaoCorreto = 0;
  var clicks = 0;
  var acertou = false;
  var errou = false;

  @override
  void initState() {
    botaoCorreto = random.nextInt(3);
    print(botaoCorreto);
    super.initState();
  }

  void botaoPressionado(int botao) {
    setState(() {
      if (botao == botaoCorreto) {
        acertou = true;
      } else {
        clicks++;
      }
      if (clicks >= 2 && !acertou) {
        errou = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (acertou) {
      return MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.green.shade400),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: Center(
            child: Text('Você ganhou!'),
          ),
        ),
      );
    }
    if (errou) {
      return MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.red.shade400),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: Center(
            child: Text('Você perdeu!'),
          ),
        ),
      );
    }

    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (() {
                    botaoPressionado(0);
                  }),
                  child: const Text('A')),
              ElevatedButton(
                  onPressed: (() {
                    botaoPressionado(1);
                  }),
                  child: const Text('B')),
              ElevatedButton(
                  onPressed: (() {
                    botaoPressionado(2);
                  }),
                  child: const Text('C')),
            ],
          ),
        ),
      ),
    );
  }
}
