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

duelo(eu, pc, context) {
  String resultado;
  if (eu == pc) {
    resultado = "Vocês escolheram a mesma opção e empataram!";
  } else if (eu == 1 && pc == 2) {
    resultado = "Você escolheu pedra e Bowser papel. Bowser venceu!";
  } else if (eu == 1 && pc == 3) {
    resultado = "Você escolheu pedra e Bowser escolheu tesoura. Você venceu!";
  } else if (eu == 2 && pc == 3) {
    resultado = "Você escolheu papel e Bowser escolheu tesoura. Bowser venceu!";
  } else if (eu == 2 && pc == 1) {
    resultado = "Você escolheu papel && Bowser pedra. Você venceu!";
  } else if (eu == 3 && pc == 1) {
    resultado = "Você escolheu tesoura e Bowser pedra. Bowser venceu!";
  } else {
    resultado = "Você escolheu tesoura e Bowser papel. Você venceu!";
  }
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Resultado final!"),
          content: Text(resultado),
          actions: [
            TextButton(
              child: const Text("Jogar novamente"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
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
                backgroundImage: AssetImage('assets/images/papai.jpeg'),
                radius: 70,
              ),
            ),
            const Text(
              "Chefão",
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
              "Clarice",
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (() {
                    escolhaJogadorEu = 1;
                    //pedra
                  }),
                  child: const Image(
                    image: AssetImage('assets/images/pedra.png'),
                    width: 100,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    escolhaJogadorEu = 2;
                    //papel
                  }),
                  child: const Image(
                    image: AssetImage(
                      'assets/images/papel.png',
                    ),
                    width: 100,
                    height: 100,
                  ),
                ),
                GestureDetector(
                  onTap: (() {
                    escolhaJogadorEu = 3;
                    //tesoura;
                  }),
                  child: const Image(
                    image: AssetImage('assets/images/tesoura.png'),
                    width: 100,
                    height: 100,
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
