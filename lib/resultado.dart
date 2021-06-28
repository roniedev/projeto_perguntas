import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final pontuacao;
  final void Function() onQuestionarioRestart;

  Resultado(this.pontuacao, this.onQuestionarioRestart);

  String get frasePontuacao {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Muito bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Grande mestre!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            frasePontuacao,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: ElevatedButton(
            onPressed: onQuestionarioRestart,
            child: Text(
              'Reiniciar questionário',
              style: TextStyle(fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}