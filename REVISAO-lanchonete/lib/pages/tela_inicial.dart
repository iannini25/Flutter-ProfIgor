import 'package:flutter/material.dart';
import '../widgets/card_produto.dart';
import 'tela_detalhes.dart';
import 'tela_pedido.dart';

class TelaInicial extends StatelessWidget {
  void abrirDetalhes(BuildContext context, String nome, String preco, String descricao) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaDetalhes(
          nome: nome,
          preco: preco,
          descricao: descricao,
        ),
      ),
    );
  }

  void verPromocao(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Promoção do dia',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Na compra de um X-Burguer, o suco sai pela metade do preço!'),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lanchonete Express'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                'Bem vindo a nossa lanchonete!',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              CardProduto(
                nome: 'X-Burguer',
                preco: 'R\$ 18,00',
                descricao: 'Pão, carne, queijo e molho especial.',
                aoClicar: () {
                  abrirDetalhes(context, 'X-Burguer', 'R\$ 18,00',
                      'Pão, carne, queijo e molho especial.');
                },
              ),
              CardProduto(
                nome: 'Batata Frita',
                preco: 'R\$ 12,00',
                descricao: 'Porção individual crocante.',
                aoClicar: () {
                  abrirDetalhes(context, 'Batata Frita', 'R\$ 12,00',
                      'Porção individual crocante.');
                },
              ),
              CardProduto(
                nome: 'Suco Natural',
                preco: 'R\$ 8,00',
                descricao: 'Suco gelado da fruta.',
                aoClicar: () {
                  abrirDetalhes(context, 'Suco Natural', 'R\$ 8,00',
                      'Suco gelado da fruta.');
                },
              ),
              CardProduto(
                nome: 'Combo Especial',
                preco: 'R\$ 28,00',
                descricao: 'X-Burguer, batata e suco.',
                aoClicar: () {
                  abrirDetalhes(context, 'Combo Especial', 'R\$ 28,00',
                      'X-Burguer, batata e suco.');
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaPedido(),
                    ),
                  );
                },
                child: Text('Fazer Pedido'),
              ),
              ElevatedButton(
                onPressed: () {
                  verPromocao(context);
                },
                child: Text('Ver promoção'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
