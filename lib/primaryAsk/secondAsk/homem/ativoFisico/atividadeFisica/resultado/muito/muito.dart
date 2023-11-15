import 'package:flutter/material.dart';
import 'package:monster_app/componentes/componentes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MuitoPage extends StatelessWidget {
  final double tbm;
  final double peso;
  final String tipoAtivo;
  final double proteinasMin;
  final double proteinasMax;
  final double carboMin;
  final double carboMax;
  const MuitoPage({
    super.key,
    required this.tbm,
    required this.peso,
    required this.tipoAtivo,
    required this.proteinasMin,
    required this.proteinasMax,
    required this.carboMin,
    required this.carboMax,
  });

  @override
  Widget build(BuildContext context) {
    int proteinaInteiroMin = proteinasMin.toInt();
    int proteinaInteiroMax = proteinasMax.toInt();
    int carboInteiroMin = carboMin.toInt();
    int carboInteiroMax = carboMax.toInt();
    int ganharPesoCaloria = 500 + tbm.toInt();
    int perderPesoCaloria = tbm.toInt() - 500;

    return Scaffold(
      // backgroundColor: Color.fromARGB(58, 20, 92, 31),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(197, 38, 173, 58),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'MACROS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: SizedBox(
                        width: 150,
                        child: Image.asset('assets/academia.png'),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'O QUE É SERIA UMA PESSOA MUITO ATIVA?',
                            overflow: TextOverflow.clip,
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            'Uma pessoa muito ativa é aquela que mantém um alto nível de atividade física, participando regularmente em exercícios intensos e adotando um estilo de vida ativo. Isso inclui atividades vigorosas, rotinas de exercícios consistentes, foco na performance e envolvimento em eventos esportivos.',
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.w400),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 120,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      child: SfCircularChart(
                        series: <DoughnutSeries>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: [
                              ChartData(
                                  'Proteínas',
                                  proteinaInteiroMax.toDouble(),
                                  ColorPalette.secundaria),
                              ChartData('CARBO', carboInteiroMax.toDouble(),
                                  ColorPalette.quarta),
                              ChartData(
                                  'CALORIAS',
                                  ganharPesoCaloria.toDouble(),
                                  ColorPalette.quinta),
                            ],
                            pointColorMapper: (ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.category,
                            yValueMapper: (ChartData data, _) => data.value,
                            dataLabelSettings: const DataLabelSettings(
                                opacity: 0.5,
                                margin: EdgeInsets.fromLTRB(1.5, 1, 1, 1),
                                isVisible: true,
                                color: ColorPalette.quarta,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(77, 20, 92, 31),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'PARA GANHO DE MASSA MUSCULAR',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Container(
                            child: Column(
                              children: [
                                const Text(
                                  'PROTEÍNAS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: ColorPalette.secundaria),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  'Mínimo: $proteinaInteiroMin',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Máximo: $proteinaInteiroMax',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'CARBOIDRATOS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: ColorPalette.quarta),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  'Mínimo: $carboInteiroMin',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Máximo: $carboInteiroMax',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'CALORIAS',
                                  style: TextStyle(
                                      color: ColorPalette.quinta,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),

                                Text(
                                  'Meta Diária: $ganharPesoCaloria',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    left: 120,
                    bottom: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      height: 200,
                      child: SfCircularChart(
                        series: <DoughnutSeries>[
                          DoughnutSeries<ChartData, String>(
                            dataSource: [
                              ChartData(
                                  'Proteínas',
                                  proteinaInteiroMax.toDouble(),
                                  ColorPalette.secundaria),
                              ChartData('CARBO', carboInteiroMax.toDouble(),
                                  ColorPalette.quarta),
                              ChartData(
                                  'CALORIAS',
                                  ganharPesoCaloria.toDouble(),
                                  ColorPalette.quinta),
                            ],
                            pointColorMapper: (ChartData data, _) => data.color,
                            xValueMapper: (ChartData data, _) => data.category,
                            yValueMapper: (ChartData data, _) => data.value,
                            dataLabelSettings: const DataLabelSettings(
                                opacity: 0.5,
                                margin: EdgeInsets.fromLTRB(1.5, 1, 1, 1),
                                isVisible: true,
                                color: ColorPalette.quarta,
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(77, 20, 92, 31),
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            'PARA PERCA DE PESO',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Opacity(
                          opacity: 0.8,
                          child: Container(
                            child: Column(
                              children: [
                                const Text(
                                  'PROTEÍNAS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: ColorPalette.secundaria),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  'Mínimo: $proteinaInteiroMin',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Máximo: $proteinaInteiroMax',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'CARBOIDRATOS',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: ColorPalette.quarta),
                                ),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                Text(
                                  'Mínimo: $carboInteiroMin',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Máximo: $carboInteiroMax',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'CALORIAS',
                                  style: TextStyle(
                                      color: ColorPalette.quinta,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),

                                Text(
                                  'Meta Diária: $perderPesoCaloria',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
