import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/segunda": (context) => SegundaTela(),
        "/sobre": (context) => SobrePage(),
      },
    );
  }
}

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
          "https://cdn.observatoriodocinema.com.br/2025/11/solo-leveling-1024x576.jpg",
          width: 300,
          height: 200,
          fit: BoxFit.cover,
          ),

            SizedBox(height: 20),
          
            ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SegundaTela()),
            );
          },
          child: Text("Abrir Segunda Tela"),
        ),
        
          ],
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
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
          "https://static.wikia.nocookie.net/naruto/images/3/3a/Modo_B%C3%A1rion_%28Anime%29.png/revision/latest?cb=20210924155608&path-prefix=pt-br",
          width: 300,
          height: 200,
          fit: BoxFit.cover,
          ),

            SizedBox(height: 20),
          
            ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SobrePage()),
            );
          },
          child: Text("Abrir Sobre"),
        ),
        
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
          "https://wallpapers.com/images/hd/supernatural-castiel-dean-and-sam-2pjzklqkpwftoous.webp",
          width: 300,
          height: 200,
          fit: BoxFit.cover,
          ),

            SizedBox(height: 20),
          
            ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: Text("Abrir Home"),
        ),
        
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
