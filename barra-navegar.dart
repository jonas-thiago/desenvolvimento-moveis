import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa de debug
      home: MenuPrincipal(),             // O Menu Principal é a primeira tela a carregar
    );
  }
}

// --- CLASSE DA BARRA DE NAVEGAÇÃO ---
class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  // Variável que guarda qual aba está selecionada
  int _indiceAtual = 0;

  // Lista com as suas telas
  final List<Widget> _telas = [
    HomePage(),
    SegundaTela(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // O body vai exibir a tela correspondente ao índice (0 para HomePage, 1 para SegundaTela)
      body: _telas[_indiceAtual],
      
      // Propriedade nativa do Scaffold para a barra inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual, // Define qual ícone fica destacado
        onTap: (indice) {
          // Atualiza a tela quando um botão é clicado
          setState(() {
            _indiceAtual = indice;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "Segunda Tela",
          ),
        ],
      ),
    );
  }
}

// --- SUAS TELAS ---
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Inicial"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        // Troquei o botão por um texto para você ver a navegação pela barra inferior funcionando
        child: Text(
          "Você está na Tela Inicial", 
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class SegundaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Tela"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Você está na segunda tela", 
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
