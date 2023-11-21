import 'package:flutter/material.dart';

import 'package:monster_app/componentes/grafico.dart';
import 'package:monster_app/componentes/tipo_ativo_descricao.dart';

class MuitoPage extends StatelessWidget {
  final double tbm;
  final double peso;
  final String tipoAtivo;
  final double proteinasMin;
  final double proteinasMax;
  final double carboMin;
  final double carboMax;
  final double gorduraDiaria;
  const MuitoPage({
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
                title: 'O QUE É SERIA UMA PESSOA MUITO ATIVA?',
                body:
                    'Uma pessoa muito ativa é aquela que mantém um alto nível de atividade física, participando regularmente em exercícios intensos e adotando um estilo de vida ativo. Isso inclui atividades vigorosas, rotinas de exercícios consistentes, foco na performance e envolvimento em eventos esportivos.',
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
