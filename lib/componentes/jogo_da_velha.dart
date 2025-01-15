import 'package:flutter/material.dart';

class JogoDaVelha extends StatefulWidget {
  const JogoDaVelha({super.key});

  @override
  State<JogoDaVelha> createState() => _JogoDaVelhaState();
}

class _JogoDaVelhaState extends State<JogoDaVelha> {
  List<String> board = List.generate(9, (index) => "");
  bool isXTurn = true;
  String winner = "";

  void _handleTap(int index) {
    if (board[index] == "" && winner == "") {
      setState(() {
        board[index] = isXTurn ? "X" : "O";
        isXTurn = !isXTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    const winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Linhas
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Colunas
      [0, 4, 8], [2, 4, 6], // Diagonais
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] != "" &&
          board[combo[0]] == board[combo[1]] &&
          board[combo[1]] == board[combo[2]]) {
        winner = board[combo[0]];
        return;
      }
    }

    if (!board.any((element) => element == "")) {
      winner = "Empate"; // Mudado para "Empate" para melhor clareza em português
    }
  }

  void _resetGame() {
    setState(() {
      board = List.generate(9, (index) => "");
      isXTurn = true;
      winner = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da Velha"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _handleTap(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: const TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (winner != "")
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                winner == "Empate" ? "Deu Empate!" : "Vencedor: $winner", // Mensagem de empate aprimorada
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ElevatedButton(
            onPressed: _resetGame,
            child: const Text("Reiniciar Jogo"), // Texto do botão mais claro
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}