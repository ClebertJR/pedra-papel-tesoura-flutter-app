import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
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
                    onTap: (() {print("pedra");}),
                    child: const Image(
                      image: AssetImage('assets/images/pedra.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {print("papel");}),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/papel.png',
                      ),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {print("tesoura");}),
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {print("jogou");},
          backgroundColor: Colors.purple,
          child: const Text("JOGAR")),
    );
  }
}
