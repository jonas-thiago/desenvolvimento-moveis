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
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

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
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
              "https://wallpapers.com/images/hd/supernatural-castiel-dean-and-sam-2pjzklqkpwftoous.webp",
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 300,
              child: TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Digite o seu nome",
                  border: OutlineInputBorder(),
                  ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: 300,
              child: TextField(
                controller: idadeController,
                decoration: const InputDecoration(labelText: "Digite a sua Idade",
                border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Perfil"),
              onPressed: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilPage(
                      nome: nomeController.text,
                      idade: idadeController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

class PerfilPage extends StatelessWidget {
  final String nome;
  final String idade;

  PerfilPage({required this.nome, required this.idade});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Perfil"),
      backgroundColor: Colors.amber,
      centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.network(
                "https://cdn.observatoriodocinema.com.br/2025/11/solo-leveling-1024x576.jpg",
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 20),

            Text("Olá $nome", style: const TextStyle(fontSize: 20)),

            SizedBox(height: 20),

            Text("Idade $idade anos", style: const TextStyle(fontSize: 20)),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, "Dados Enviados");
              },
              child: Text("Voltar"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
