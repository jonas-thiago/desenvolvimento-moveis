import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Teste',
      theme: ThemeData(
        
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 65, 2, 173),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Teste'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var nome = 'Jonas';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _descrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(nome),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end, // Alinha os botões à direita
        children: [
          FloatingActionButton(
            onPressed: _descrementCounter, // Chama a função que você criou
            tooltip: 'Decrement',
            child: const Icon(Icons.remove), // Ícone de menos
          ),
          const SizedBox(
            width: 16,
          ), // Dá um pequeno espaço entre os dois botões
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add), // Ícone de mais
          ),
        ],
      ),
    );
  }
}
