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

enum EstadosDoJogo {
  emAndamento,
  ganhou,
  perdeu,
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
  var situacao = EstadosDoJogo.emAndamento;
  var vitorias = 0;
  var derrotas = 0;

  @override
  void initState() {
    super.initState();
    jogar();
  }

  void jogar() {
    setState(() {
      botaoCorreto = random.nextInt(3);
      print(botaoCorreto);
      clicks = 0;
      situacao = EstadosDoJogo.emAndamento;
    });
  }

  void botaoPressionado(int botao) {
    setState(() {
      if (botao == botaoCorreto) {
        situacao = EstadosDoJogo.ganhou;
        vitorias++;
      } else {
        clicks++;
      }
      if (clicks >= 2 && situacao != EstadosDoJogo.ganhou) {
        situacao = EstadosDoJogo.perdeu;
        derrotas++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return switch (situacao) {
      EstadosDoJogo.ganhou => Venceu(jogar),
      EstadosDoJogo.perdeu => Perdeu(jogar),
      EstadosDoJogo.emAndamento =>
        JogoEmAndamento(vitorias, derrotas, botaoPressionado)
    };
  }
}

class Perdeu extends StatelessWidget {
  const Perdeu(this.jogar, {super.key});

  final void Function() jogar;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: Colors.red.shade400),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Você Perdeu! :('),
              ElevatedButton(
                  onPressed: () {
                    jogar();
                  },
                  child: const Text('Jogar Novamente'))
            ],
          ),
        )));
  }
}

class Venceu extends StatelessWidget {
  const Venceu(this.jogar, {super.key});

  final void Function() jogar;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.green.shade400),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Você ganhou!'),
              ElevatedButton(
                  onPressed: () {
                    jogar();
                  },
                  child: const Text('Jogar Novamente'))
            ],
          ),
        ),
      ),
    );
  }
}

class JogoEmAndamento extends StatelessWidget {
  const JogoEmAndamento(this.vitorias, this.derrotas, this.botaoPressionado,
      {super.key});

  final int vitorias;
  final int derrotas;

  final void Function(int) botaoPressionado;

  @override
  Widget build(BuildContext context) {
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
              Text(
                'Vitorias: $vitorias',
              ),
              Text('Derrotas: $derrotas'),
            ],
          ),
        ),
      ),
    );
  }
}
