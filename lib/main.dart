import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resposta.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 7},
        {'texto': 'Vermelho', 'pontuacao': 8},
        {'texto': 'Verde', 'pontuacao': 9},
        {'texto': 'Branco', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 7},
        {'texto': 'Gato', 'pontuacao': 8},
        {'texto': 'Papagaio', 'pontuacao': 9},
        {'texto': 'Tubarão', 'pontuacao': 10},
      ]
    },
    {
      'texto': 'Qual é o seu time favorito?',
      'respostas': [
        {'texto': 'Vasco', 'pontuacao': 7},
        {'texto': 'Palmeiras', 'pontuacao': 8},
        {'texto': 'Santos', 'pontuacao': 9},
        {'texto': 'Flamengo', 'pontuacao': 10},
      ]
    },
  ];

  var _perguntaSelecionada = 0;

  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (isPerguntaSelected) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get isPerguntaSelected {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: isPerguntaSelected
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelected: _perguntaSelecionada,
                  onSelectedCallback: _responder)
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
