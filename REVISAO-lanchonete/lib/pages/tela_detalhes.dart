import 'package:flutter/material.dart';

class TelaDetalhes extends StatefulWidget {
  final String nome;
  final String preco;
  final String descricao;

  TelaDetalhes({
    required this.nome,
    required this.preco,
    required this.descricao,
  });

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  bool destaque = false;

  void mudarDestaque() {
    setState(() {
      destaque = !destaque;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: double.infinity,
                height: destaque ? 200 : 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: destaque ? Colors.orange : Colors.grey[300],
                  borderRadius: BorderRadius.circular(destaque ? 40 : 10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.nome,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(widget.preco),
                    SizedBox(height: 10),
                    Text(
                      widget.descricao,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              if (destaque) Text('Produto mais pedido da semana!'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: mudarDestaque,
                child: Text('Adicionar destaque'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
