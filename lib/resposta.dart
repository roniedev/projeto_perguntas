import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String text;
  final void Function()? onSelectedCallback;

  Resposta(this.text, this.onSelectedCallback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          textColor: Colors.white,
          color: Colors.blue,
          child: Text(text),
          onPressed: onSelectedCallback,
        ),
      ),
    );
  }
}
