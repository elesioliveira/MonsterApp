import 'dart:core';

import 'package:flutter/material.dart';

import 'resultado/extremamente/extremamente.dart';
import 'resultado/levemente/levemente.dart';
import 'resultado/moderadamente/moderadamente.dart';
import 'resultado/muito/muito.dart';
import 'resultado/sedentario/sendentario_page.dart';

class TipoAtivo extends StatelessWidget {
  final double tbm;
  final double peso;
  final double tbmSedentario;
  final double tbmLevementeAtivo;
  final double tbmModeradamenteAtivo;
  final double tbmMuitoAtivo;
  final double tbmExtremamenteAtivo;
  final double proteinasMin;
  final double proteinasMax;
  final double carboMin;
  final double carboMax;
  final double? gorduraDiariaSedentario;
  final double? gorduraDiariaLevemente;
  final double? gorduraDiariaModeradamente;
  final double? gorduraDiariaMuito;
  final double? gorduraDiariaExtremamente;

  const TipoAtivo({
    super.key,
    required this.tbm,
    required this.peso,
    required this.tbmSedentario,
    required this.tbmLevementeAtivo,
    required this.tbmModeradamenteAtivo,
    required this.tbmMuitoAtivo,
    required this.tbmExtremamenteAtivo,
    required this.proteinasMin,
    required this.proteinasMax,
    required this.carboMin,
    required this.carboMax,
    this.gorduraDiariaSedentario,
    this.gorduraDiariaLevemente,
    this.gorduraDiariaModeradamente,
    this.gorduraDiariaMuito,
    this.gorduraDiariaExtremamente,
  }); // Construtor que recebe o valor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            child: const Center(child: Text('ETAPA 3')),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SedentarioPage(
                            gorduraDiaria: gorduraDiariaLevemente!,
                            carboMin: carboMin,
                            carboMax: carboMax,
                            proteinasMax: proteinasMax,
                            proteinasMin: proteinasMin,
                            tbm: tbmSedentario,
                            peso: peso,
                            tipoAtivo: 'SEDENTÁRIO',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'SOU SEDENTÁRIO',
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LevementePage(
                            gorduraDiaria: gorduraDiariaLevemente!,
                            carboMin: carboMin,
                            carboMax: carboMax,
                            proteinasMax: proteinasMax,
                            proteinasMin: proteinasMin,
                            tbm: tbmLevementeAtivo,
                            peso: peso,
                            tipoAtivo: 'LEVEMENTE',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'SOU LEVEMENTE ATIVO',
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModeradamentePage(
                            gorduraDiaria: gorduraDiariaModeradamente!,
                            carboMin: carboMin,
                            carboMax: carboMax,
                            proteinasMax: proteinasMax,
                            proteinasMin: proteinasMin,
                            tbm: tbmModeradamenteAtivo,
                            peso: peso,
                            tipoAtivo: 'MODERADAMENTE',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'SOU MODERADAMENTE ATIVO',
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MuitoPage(
                            gorduraDiaria: gorduraDiariaMuito!,
                            carboMin: carboMin,
                            carboMax: carboMax,
                            proteinasMax: proteinasMax,
                            proteinasMin: proteinasMin,
                            tbm: tbmMuitoAtivo,
                            peso: peso,
                            tipoAtivo: 'MUITO',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'SOU MUITO ATIVO',
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExtremamentePage(
                            gorduraDiaria: gorduraDiariaExtremamente!,
                            carboMin: carboMin,
                            carboMax: carboMax,
                            proteinasMax: proteinasMax,
                            proteinasMin: proteinasMin,
                            tbm: tbmExtremamenteAtivo,
                            peso: peso,
                            tipoAtivo: 'EXTREMAMENTE',
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'SOU EXTREMAMENTE ATIVO',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Stack(
              children: [
                Container(
                  child: Image.asset('assets/ladoDireto.png'),
                ),
                const Positioned(
                  top: 10,
                  right: 60,
                  child: Text(
                    'Continue \npara \nser mais \neficaz',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
