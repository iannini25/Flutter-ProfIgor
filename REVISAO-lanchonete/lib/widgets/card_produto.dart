import 'package:flutter/material.dart';

class CardProduto extends StatelessWidget {
  final String nome;
  final String preco;
  final String descricao;
  final VoidCallback aoClicar;

  CardProduto({
    required this.nome,
    required this.preco,
    required this.descricao,
    required this.aoClicar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nome,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(preco),
              ],
            ),
            SizedBox(height: 5),
            Text(descricao),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: aoClicar,
              child: Text('Ver detalhes'),
            ),
          ],
        ),
      ),
    );
  }
}
