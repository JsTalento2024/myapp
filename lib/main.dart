import 'package:flutter/material.dart';
import 'componentes/jogo_da_velha.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const String titulo = 'Jogo da velha';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titulo,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(0, 40, 224, 221)),
        useMaterial3: true,
      ),
      home: const HomePage(title: titulo),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.red,
                      // child: Text('Primeira coluna'),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 207, 230, 210),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromARGB(255, 23, 99, 60),
                            width: 3,
                          )),
                      child: JogoDaVelha(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      // color: const Color.fromARGB(255, 241, 54, 244),
                      // child: Text('Terceira Coluna'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                // color: Colors.blue,
                //child: Text('Layout Inferior'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
