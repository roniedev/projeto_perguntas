import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelected;
  final void Function(int) onSelectedCallback;

  Questionario(
      {required this.perguntas,
      required this.perguntaSelected,
      required this.onSelectedCallback});

  bool get isPerguntaSelected {
    return perguntaSelected < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = isPerguntaSelected
        ? perguntas[perguntaSelected]['respostas'] as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelected]['texto'].toString()),
        ...respostas.map((e) => Resposta(e['texto'].toString(),
            () => onSelectedCallback(int.parse(e['pontuacao'].toString())))),
      ],
    );
  }
}
