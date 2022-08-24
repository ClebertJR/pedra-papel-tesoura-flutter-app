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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [Text("Papai"), Text("VS"), Text("Clarice")]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: const Image(
                      image: AssetImage(
                        'assets/images/papel.png',
                      ),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  GestureDetector(
                    child: const Image(
                      image: AssetImage('assets/images/pedra.png'),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  GestureDetector(
                    child: const Image(
                      image: AssetImage('assets/images/tesoura.png'),
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          child: const Icon(Icons.play_arrow)),
    );
  }
}
