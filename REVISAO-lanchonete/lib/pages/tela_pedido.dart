import 'package:flutter/material.dart';

class TelaPedido extends StatefulWidget {
  @override
  State<TelaPedido> createState() => _TelaPedidoState();
}

class _TelaPedidoState extends State<TelaPedido> {
  final campoNome = TextEditingController();
  final campoProduto = TextEditingController();
  final campoObservacao = TextEditingController();

  int pedidos = 0;

  void enviarPedido() {
    String nome = campoNome.text;
    String produto = campoProduto.text;

    if (nome == '' || produto == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Preencha o nome e o produto')),
      );
    } else {
      setState(() {
        pedidos = pedidos + 1;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pedido enviado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fazer Pedido'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Pedidos enviados: $pedidos'),
              SizedBox(height: 20),
              TextField(
                controller: campoNome,
                decoration: InputDecoration(
                  labelText: 'Nome do cliente',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: campoProduto,
                decoration: InputDecoration(
                  labelText: 'Produto',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: campoObservacao,
                decoration: InputDecoration(
                  labelText: 'Observação',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: enviarPedido,
                child: Text('Enviar Pedido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
