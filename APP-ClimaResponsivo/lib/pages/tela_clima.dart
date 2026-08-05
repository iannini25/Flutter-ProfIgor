import 'package:flutter/material.dart';
import '../models/cidade_clima.dart';
import '../widgets/area_cidades.dart';
import '../widgets/painel_informacoes.dart';

class TelaClima extends StatelessWidget {
  const TelaClima({super.key});

  @override
  Widget build(BuildContext context) {
    List<CidadeClima> cidades = [
      CidadeClima(
        nome: 'Belo Horizonte',
        temperatura: '28°C',
        condicao: 'Ensolarado',
        icone: Icons.wb_sunny,
      ),
      CidadeClima(
        nome: 'Curitiba',
        temperatura: '17°C',
        condicao: 'Chuvoso',
        icone: Icons.umbrella,
      ),
      CidadeClima(
        nome: 'São Paulo',
        temperatura: '22°C',
        condicao: 'Nublado',
        icone: Icons.cloud,
      ),
      CidadeClima(
        nome: 'Porto Alegre',
        temperatura: '15°C',
        condicao: 'Frio',
        icone: Icons.ac_unit,
      ),
      CidadeClima(
        nome: 'Rio de Janeiro',
        temperatura: '32°C',
        condicao: 'Quente',
        icone: Icons.wb_sunny,
      ),
      CidadeClima(
        nome: 'Recife',
        temperatura: '29°C',
        condicao: 'Vento Forte',
        icone: Icons.air,
      ),
      CidadeClima(
        nome: 'Salvador',
        temperatura: '30°C',
        condicao: 'Ensolarado',
        icone: Icons.wb_sunny,
      ),
      CidadeClima(
        nome: 'Manaus',
        temperatura: '34°C',
        condicao: 'Tempestade',
        icone: Icons.thunderstorm,
      ),
      CidadeClima(
        nome: 'Florianópolis',
        temperatura: '20°C',
        condicao: 'Nublado',
        icone: Icons.cloud,
      ),
      CidadeClima(
        nome: 'Brasília',
        temperatura: '26°C',
        condicao: 'Quente',
        icone: Icons.wb_sunny,
      ),
    ];

    List<String> categorias = [
      'Ensolarado',
      'Chuvoso',
      'Frio',
      'Quente',
      'Nublado',
      'Vento Forte',
      'Tempestade',
    ];

    double largura = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Agora'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          String dispositivo;
          int colunas;

          if (largura < 600) {
            dispositivo = 'Celular';
            colunas = 1;
          } else if (largura < 900) {
            dispositivo = 'Tablet';
            colunas = 2;
          } else {
            dispositivo = 'Desktop';
            colunas = 3;
          }

          List<CidadeClima> cidadesDaTela = cidades;
          if (dispositivo == 'Celular') {
            cidadesDaTela = cidades.sublist(0, 4);
          }

          Widget parteDeBaixo;
          if (dispositivo == 'Desktop') {
            parteDeBaixo = Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: AreaCidades(cidades: cidadesDaTela, colunas: colunas),
                ),
                const Expanded(
                  flex: 1,
                  child: PainelInformacoes(),
                ),
              ],
            );
          } else {
            parteDeBaixo = Column(
              children: [
                AreaCidades(cidades: cidadesDaTela, colunas: colunas),
                const PainelInformacoes(),
              ],
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  child: AspectRatio(
                    aspectRatio: 5,
                    child: FittedBox(
                      child: Column(
                        children: const [
                          Text(
                            '☀️ Clima Agora',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Confira as condições do tempo em diversas cidades.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categorias.map((c) {
                      return Chip(label: Text(c));
                    }).toList(),
                  ),
                ),
                Text('Largura atual: ${largura.toInt()} px'),
                Text('Dispositivo: $dispositivo'),
                if (dispositivo == 'Desktop')
                  const Text('🌎 Dados climáticos atualizados em tempo real.'),
                if (dispositivo == 'Tablet')
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Previsão de 7 dias')),
                      );
                    },
                    child: const Text('Ver previsão para 7 dias'),
                  ),
                parteDeBaixo,
              ],
            ),
          );
        },
      ),
    );
  }
}
