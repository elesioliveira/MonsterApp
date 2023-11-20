// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'componentes.dart';

class Grafico extends StatefulWidget {
  const Grafico({
    Key? key,
    required this.proteinaInteiroMax,
    required this.carboInteiroMax,
    required this.ganharPesoCaloria,
    required this.metaDiariaGordura,
    required this.proteinaInteiroMin,
    required this.carboInteiroMin,
    required this.perderPeso,
  }) : super(key: key);
  final int proteinaInteiroMax;
  final int carboInteiroMax;
  final int ganharPesoCaloria;
  final int metaDiariaGordura;
  final int proteinaInteiroMin;
  final int carboInteiroMin;
  final int perderPeso;

  @override
  State<Grafico> createState() => _GraficoState();
}

class _GraficoState extends State<Grafico> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'PARA GANHO DE MASSA MUSCULAR',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: SfCircularChart(
                      legend: const Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: <CircularSeries>[
                        PieSeries<ChartData, String>(
                          dataSource: [
                            ChartData('Proteínas', widget.proteinaInteiroMax,
                                ColorPaletteGrafico.primeira),
                            ChartData('CARBO', widget.carboInteiroMax,
                                ColorPaletteGrafico.quinta),
                            ChartData('CALORIAS', widget.ganharPesoCaloria,
                                ColorPaletteGrafico.terceira),
                            ChartData('GORDURA', widget.metaDiariaGordura,
                                ColorPaletteGrafico.quarta),
                          ],
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.category,
                          yValueMapper: (ChartData data, _) => data.value,
                          dataLabelSettings: const DataLabelSettings(
                              opacity: 0.5,
                              margin: EdgeInsets.fromLTRB(1.5, 1, 1, 1),
                              isVisible: true,
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'PROTEÍNAS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: ColorPaletteGrafico.primeira),
                                    ),
                                    Text(
                                      'MÍNIMO DIÁRIO: ${widget.proteinaInteiroMin}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPaletteGrafico.primeira),
                                    ),
                                    Text(
                                      'MÁXIMO DIÁRIO: ${widget.proteinaInteiroMax}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPaletteGrafico.primeira),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'CARBOIDRATOS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: ColorPaletteGrafico.quinta),
                                      ),
                                      Text(
                                        'MÍNIMO DIÁRIO: ${widget.carboInteiroMin}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: ColorPaletteGrafico.quinta),
                                      ),
                                      Text(
                                        'MÁXIMO DIÁRIO: ${widget.carboInteiroMax}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: ColorPaletteGrafico.quinta),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'CALORIAS',
                                      style: TextStyle(
                                          color: ColorPaletteGrafico.terceira,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'DIÁRIO: ${widget.ganharPesoCaloria}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPaletteGrafico.terceira),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'GORDURA',
                            style: TextStyle(
                              color: ColorPaletteGrafico.quarta,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'DIÁRIO: ${widget.metaDiariaGordura}',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: ColorPaletteGrafico.quarta),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'PARA PERCA DE PESO',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: SfCircularChart(
                      legend: const Legend(
                          isVisible: true,
                          overflowMode: LegendItemOverflowMode.wrap),
                      series: <CircularSeries>[
                        PieSeries<ChartData, String>(
                          dataSource: [
                            ChartData('Proteínas', widget.proteinaInteiroMax,
                                ColorPaletteGrafico.primeira),
                            ChartData('CARBO', widget.carboInteiroMax,
                                ColorPaletteGrafico.quinta),
                            ChartData('CALORIAS', widget.ganharPesoCaloria,
                                ColorPaletteGrafico.terceira),
                            ChartData('GORDURA', widget.metaDiariaGordura,
                                ColorPaletteGrafico.quarta),
                          ],
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.category,
                          yValueMapper: (ChartData data, _) => data.value,
                          dataLabelSettings: const DataLabelSettings(
                              opacity: 0.5,
                              margin: EdgeInsets.fromLTRB(1.5, 1, 1, 1),
                              isVisible: true,
                              color: Colors.transparent,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'PROTEÍNAS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: ColorPaletteGrafico.primeira),
                                    ),
                                    Text(
                                      'MÍNIMO DIÁRIO: ${widget.proteinaInteiroMin}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPaletteGrafico.primeira),
                                    ),
                                    Text(
                                      'MÁXIMO DIÁRIO: ${widget.proteinaInteiroMax}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPaletteGrafico.primeira),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'CARBOIDRATOS',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: ColorPaletteGrafico.quinta),
                                      ),
                                      Text(
                                        'MÍNIMO DIÁRIO: ${widget.carboInteiroMin}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: ColorPaletteGrafico.quinta),
                                      ),
                                      Text(
                                        'MÁXIMO DIÁRIO: ${widget.carboInteiroMax}',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: ColorPaletteGrafico.quinta),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'CALORIAS',
                                      style: TextStyle(
                                          color: ColorPaletteGrafico.terceira,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      'DIÁRIO: ${widget.perderPeso}',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPaletteGrafico.terceira),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'GORDURA',
                            style: TextStyle(
                              color: ColorPaletteGrafico.quarta,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'DIÁRIO: ${widget.metaDiariaGordura}',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: ColorPaletteGrafico.quarta),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

abstract class ColorPaletteGrafico {
  static const Color primeira = Color(0XFF69FF4E);
  static const Color segunda = Color(0XFFE8C147);
  static const Color terceira = Color(0XFFFF664E);
  static const Color quarta = Color(0XFFA0EBCB);
  static const Color quinta = Color(0XFF41D9FF);
}
