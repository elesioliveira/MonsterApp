import 'package:flutter/material.dart';

import 'package:monster_app/componentes/grafico.dart';

import '../../componentes/tipo_ativo_descricao.dart';

class ExtremamentePage extends StatelessWidget {
  final double tbm;
  final double peso;
  final String tipoAtivo;
  final double proteinasMin;
  final double proteinasMax;
  final double carboMin;
  final double carboMax;
  final double gorduraDiaria;
  const ExtremamentePage({
    super.key,
    required this.tbm,
    required this.peso,
    required this.tipoAtivo,
    required this.proteinasMin,
    required this.proteinasMax,
    required this.carboMin,
    required this.carboMax,
    required this.gorduraDiaria,
  });

  @override
  Widget build(BuildContext context) {
    int proteinaInteiroMin = proteinasMin.toInt();
    int proteinaInteiroMax = proteinasMax.toInt();
    int carboInteiroMin = carboMin.toInt();
    int carboInteiroMax = carboMax.toInt();
    int ganharPesoCaloria = 500 + tbm.toInt();
    int perderPesoCaloria = tbm.toInt() - 500;
    int metaDiariaGordura = gorduraDiaria.toInt();

    return Scaffold(
      // backgroundColor: Color.fromARGB(58, 20, 92, 31),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const TipoAtivoResultado(
                title: 'O QUE É SERIA UMA PESSOA EXTREMAMENTE ATIVA?',
                body:
                    'Uma pessoa extremamente ativa mantém um nível excecionalmente alto de atividade física, envolvendo-se em exercícios vigorosos e adotando uma abordagem dedicada e disciplinada em relação à sua rotina de atividades. Isso pode incluir treinamentos especializados, participação em competições de elite e uma rotina diária intensa, com o foco na melhoria contínua da performance física.',
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Center(
                  child: Grafico(
                    proteinaInteiroMax: proteinaInteiroMax,
                    carboInteiroMax: carboInteiroMax,
                    ganharPesoCaloria: ganharPesoCaloria,
                    metaDiariaGordura: metaDiariaGordura,
                    proteinaInteiroMin: proteinaInteiroMin,
                    carboInteiroMin: carboInteiroMin,
                    perderPeso: perderPesoCaloria,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
