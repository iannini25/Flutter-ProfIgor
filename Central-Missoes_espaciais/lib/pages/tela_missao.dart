import 'package:flutter/material.dart';
import '../widgets/card_missao.dart';
import 'tela_astronauta.dart';

class TelaMissao extends StatefulWidget {
  const TelaMissao({super.key});

  @override
  State<TelaMissao> createState() => _TelaMissaoState();
}

class _TelaMissaoState extends State<TelaMissao> {
  final campoNome = TextEditingController();
  final campoPlaneta = TextEditingController();

  int energia = 50;
  String tipo = 'Exploração';

  @override
  void dispose() {
    campoNome.dispose();
    campoPlaneta.dispose();
    super.dispose();
  }

  void aumentarEnergia() {
    setState(() {
      if (energia < 100) {
        energia = energia + 10;
      }
    });
  }

  void diminuirEnergia() {
    setState(() {
      if (energia > 0) {
        energia = energia - 10;
      }
    });
  }

  void verMissao() {
    String nome = campoNome.text;
    String planeta = campoPlaneta.text;

    if (nome == '' || planeta == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha os campos'),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaAstronauta(
            nome: nome,
            planeta: planeta,
            energia: energia,
            tipo: tipo,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Central de Missões'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Icon(
                Icons.rocket_launch,
                size: 90,
              ),

              const SizedBox(height: 16),

              TextField(
                controller: campoNome,
                decoration: const InputDecoration(
                  labelText: 'Nome do astronauta',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: campoPlaneta,
                decoration: const InputDecoration(
                  labelText: 'Planeta de destino',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 12),

              DropdownButton<String>(
                value: tipo,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Exploração',
                    child: Text('Exploração'),
                  ),
                  DropdownMenuItem(
                    value: 'Resgate',
                    child: Text('Resgate'),
                  ),
                  DropdownMenuItem(
                    value: 'Pesquisa científica',
                    child: Text('Pesquisa científica'),
                  ),
                ],
                onChanged: (valor) {
                  setState(() {
                    tipo = valor!;
                  });
                },
              ),

              const SizedBox(height: 16),

              Text(
                'Energia: $energia',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: diminuirEnergia,
                      child: const Text('Diminuir'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: aumentarEnergia,
                      child: const Text('Aumentar'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                'Etapas da missão:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const CardMissao(
                icone: Icons.rocket_launch,
                titulo: 'Preparação',
                descricao: 'Verifique todos os equipamentos da nave.',
              ),

              const SizedBox(height: 10),

              const CardMissao(
                icone: Icons.travel_explore,
                titulo: 'Viagem espacial',
                descricao: 'A nave viaja até o planeta escolhido.',
              ),

              const SizedBox(height: 10),

              const CardMissao(
                icone: Icons.public,
                titulo: 'Exploração do planeta',
                descricao: 'Explore o planeta e colete informações.',
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: verMissao,
                child: const Text('Visualizar missão'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
