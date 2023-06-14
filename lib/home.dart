import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Random random = Random();
late int escolhaJogadorEu;
late int escolhaJogadorPC;
List<Color> borderColors = [
  Colors.transparent,
  Colors.transparent,
  Colors.transparent
];
List<double> borderWidths = [0, 0, 0];
int countPC = 0;
int countEu = 0;

duelo(eu, pc, context) {
  String resultado;
  if (eu == pc) {
    resultado = "Vocês escolheram a mesma opção e empataram!";
  } else if (eu == 1 && pc == 2) {
    resultado = "Você escolheu pedra e Bowser papel. Bowser venceu!";
    countPC++;
  } else if (eu == 1 && pc == 3) {
    resultado = "Você escolheu pedra e Bowser escolheu tesoura. Você venceu!";
    countEu++;
  } else if (eu == 2 && pc == 3) {
    resultado = "Você escolheu papel e Bowser escolheu tesoura. Bowser venceu!";
    countPC++;
  } else if (eu == 2 && pc == 1) {
    resultado = "Você escolheu papel e Bowser pedra. Você venceu!";
    countEu++;
  } else if (eu == 3 && pc == 1) {
    resultado = "Você escolheu tesoura e Bowser pedra. Bowser venceu!";
    countPC++;
  } else {
    resultado = "Você escolheu tesoura e Bowser papel. Você venceu!";
    countEu++;
  }
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Resultado final!",
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                resultado,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Cacá"),
                  Text(countEu.toString()),
                  const Text("X"),
                  Text(countPC.toString()),
                  const Text("Bowser"),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                "Jogar novamente",
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}

void onTapImage(int index) {
  borderColors[index] = Colors.purple;
  borderWidths[index] = 5;
  for (int i = 0; i < borderColors.length; i++) {
    if (i != index) {
      borderColors[i] = Colors.transparent;
      borderWidths[i] = 0;
    }
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel, Tesoura!"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 80,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/bowser.png'),
                radius: 70,
              ),
            ),
            const Text(
              "Bowser",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text(
              "VS",
              style: TextStyle(fontSize: 100),
            ),
            const CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 80,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/clarice.jpeg'),
                radius: 70,
              ),
            ),
            const Text(
              "Cacá",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (() {
                    escolhaJogadorEu = 1; //pedra
                    onTapImage(0);
                    setState(() {
                      borderColors[0] = Colors.yellow;
                      borderWidths[0] = 8;
                    });
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: borderColors[0],
                        width: borderWidths[0],
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/pedra.png',
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    escolhaJogadorEu = 2; //papel
                    onTapImage(1);
                    setState(() {
                      borderColors[1] = Colors.red;
                      borderWidths[1] = 8;
                    });
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: borderColors[1],
                        width: borderWidths[1],
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/papel.png',
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    escolhaJogadorEu = 3; //tesoura
                    onTapImage(2);
                    setState(() {
                      borderColors[2] = Colors.blue;
                      borderWidths[2] = 8;
                    });
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(
                        color: borderColors[2],
                        width: borderWidths[2],
                      ),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/tesoura.png',
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            escolhaJogadorPC = random.nextInt(3) + 1;
            duelo(escolhaJogadorEu, escolhaJogadorPC, context);
          },
          backgroundColor: Colors.purple,
          child: const Text("JOGAR")),
    );
  }
}
