import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Teste',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 36, 1, 97),
        ),
      ),
      home: const MyHomePage(title: 'Meu Teste'),
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
  TextEditingController alunoController = TextEditingController();
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  TextEditingController continuarController = TextEditingController();
  TextEditingController nota4Controller = TextEditingController();

  double mediaFinal = 0.0;
  String situacaoDoAluno = '';

  List<Map<String, dynamic>> listaDeAlunos = [];

  void sistemaAcademico() {
    setState(() {
      double n1 = double.tryParse(nota1Controller.text) ?? 0.0;
      double n2 = double.tryParse(nota2Controller.text) ?? 0.0;
      double n3 = double.tryParse(nota3Controller.text) ?? 0.0;


      switch (continuarController.text.toLowerCase().trim()) {
        case 's':
          double n4 = double.tryParse(nota4Controller.text) ?? 0.0;
          mediaFinal = (n1 + n2 + n3 + n4) / 4;
          break;
        case 'n':
        default:
          mediaFinal = (n1 + n2 + n3) / 3;
          break;
      }

      if (mediaFinal >= 7 && mediaFinal < 9) {
        situacaoDoAluno = 'Aprovado';
      } else if (mediaFinal < 5) {
        situacaoDoAluno = 'Reprovado';
      } else if (mediaFinal >= 5 && mediaFinal < 7) {
        situacaoDoAluno = 'Recuperação';
      } else if (mediaFinal >= 9) {
        situacaoDoAluno = 'Aluno Destaque';
      }

      Map<String, dynamic> novoAluno = {
        'nome': alunoController.text,
        'media': mediaFinal,
        'situacao': situacaoDoAluno,
      };

      listaDeAlunos.add(novoAluno);

      alunoController.clear();
      nota1Controller.clear();
      nota2Controller.clear();
      nota3Controller.clear();
      continuarController.clear();
      nota4Controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.amberAccent),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // O COLCHETE DA LISTA COMEÇA AQUI
                children: [
                  const Text(
                    '=== Sistema Acadêmico ===',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  TextField(
                    controller: alunoController,
                    decoration: const InputDecoration(
                      labelText: 'Digite o nome do Aluno: ',
                    ),
                  ),

                  TextField(
                    controller: nota1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Digite a primeira nota: ',
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  TextField(
                    controller: nota2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Digite a segunda nota: ',
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  TextField(
                    controller: nota3Controller,
                    decoration: const InputDecoration(
                      labelText: 'Digite a terceira nota: ',
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  TextField(
                    controller: continuarController,
                    decoration: const InputDecoration(
                      labelText: 'Existe a quarta nota? responda com s/n ',
                    ),
                  ),

                  TextField(
                    controller: nota4Controller,
                    decoration: const InputDecoration(
                      labelText: 'Digite a quarta nota (se houver): ',
                    ),
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: sistemaAcademico,
                    child: const Text('Calcular Média'),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    'O aluno atual: ${alunoController.text}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Média atual: ${mediaFinal.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Situação atual: $situacaoDoAluno',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Divider(
                    height: 40,
                    thickness: 2,
                  ), // Uma linha para separar
                  const Text(
                    '--- Histórico de Alunos ---',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),

                  ...listaDeAlunos.map((aluno) {
                    return Text(
                      'Aluno: ${aluno['nome']} | Média: ${aluno['media'].toStringAsFixed(2)} | ${aluno['situacao']}',
                    );
                  }).toList(),
                ], // O COLCHETE DA LISTA TERMINA AQUI, depois de todos os itens!
              ),
            ),
          ),
        ),
      ),
    );
  }
}
