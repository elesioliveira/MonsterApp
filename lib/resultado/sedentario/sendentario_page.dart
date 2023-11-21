import 'package:flutter/material.dart';
import 'package:monster_app/componentes/componentes.dart';
import 'package:monster_app/componentes/tipo_ativo_descricao.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../componentes/grafico.dart';

class SedentarioPage extends StatelessWidget {
  final double tbm;
  final double peso;
  final String tipoAtivo;
  final double proteinasMin;
  final double proteinasMax;
  final double carboMin;
  final double carboMax;
  final double gorduraDiaria;
  const SedentarioPage({
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
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const TipoAtivoResultado(
              title: 'O QUE É SERIA UMA PESSOA SEDENTARIA?',
              body:
                  'Uma pessoa sedentária é aquela que tem um estilo de vida caracterizado pela falta de atividade física regular. Isso envolve passar a maior parte do tempo sentada e participar de poucas ou nenhum exercício.',
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
    );
  }
}
