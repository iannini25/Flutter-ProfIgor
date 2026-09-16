import '../models/produto.dart';
import 'banco.dart';

class ProdutoService {
  Future<void> cadastrar(Produto produto) async {
    final db = await banco;
    await db.insert('produtos', produto.paraMap());
    print('INSERT → Produto cadastrado: ${produto.nome}');
  }

  Future<List<Produto>> listar() async {
    final db = await banco;
    final lista = await db.query('produtos');

    print('SELECT → Produtos encontrados:');
    for (final item in lista) {
      print('{id: ${item['id']}, nome: ${item['nome']}, quantidade: ${item['quantidade']}}');
    }

    List<Produto> produtos = [];
    for (final item in lista) {
      produtos.add(Produto(
        id: item['id'] as int,
        nome: item['nome'] as String,
        categoria: item['categoria'] as String,
        quantidade: item['quantidade'] as int,
        preco: item['preco'] as double,
      ));
    }

    return produtos;
  }

  Future<void> mudarQuantidade(Produto produto, int novaQuantidade) async {
    final db = await banco;

    print('UPDATE → ${produto.nome}');
    print('Quantidade anterior: ${produto.quantidade}');
    print('Nova quantidade: $novaQuantidade');

    await db.update('produtos', {'quantidade': novaQuantidade},
        where: 'id = ?', whereArgs: [produto.id]);
  }

  Future<void> excluir(Produto produto) async {
    final db = await banco;
    await db.delete('produtos', where: 'id = ?', whereArgs: [produto.id]);
    print('DELETE → Produto excluído: ${produto.nome}');
  }

  Future<void> mostrarProdutosNoTerminal() async {
    final db = await banco;

    final produtos = await db.query('produtos');

    print('===== PRODUTOS NO BANCO =====');

    for (final produto in produtos) {
      print(produto);
    }
  }
}
