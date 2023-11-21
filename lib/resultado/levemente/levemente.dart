import 'package:flutter/material.dart';

import '../../componentes/grafico.dart';
import '../../componentes/tipo_ativo_descricao.dart';

class LevementePage extends StatelessWidget {
  final double tbm;
  final double peso;
  final String tipoAtivo;
  final double proteinasMin;
  final double proteinasMax;
  final double carboMin;
  final double carboMax;
  final double gorduraDiaria;
  const LevementePage({
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const TipoAtivoResultado(
                title: 'O QUE É SERIA UMA PESSOA LEVEMENTE ATIVA?',
                body:
                    'Uma pessoa levemente ativa é aquela que se envolve regularmente em atividades físicas, mas em níveis moderados ou leves. Isso pode incluir exercícios suaves, como caminhadas regulares, ciclismo leve ou atividades recreativas.'),
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
    );
  }
}
