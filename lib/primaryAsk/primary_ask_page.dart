import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monster_app/identity/identity.dart';

import 'package:monster_app/primaryAsk/cubits/todo_states.dart';

import '../secondAsk/second_ask_view.dart';
import 'cubits/todo_cubits.dart';

class PrimaryAsk extends StatefulWidget {
  const PrimaryAsk({super.key});

  @override
  State<PrimaryAsk> createState() => _PrimaryAskState();
}

class _PrimaryAskState extends State<PrimaryAsk> {
  late final PrimaryAskCubit cubit;
  final desativarButton = ValueNotifier(false);
  HomemPageController tipoGenero = HomemPageController();

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<PrimaryAskCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: Stack(
              children: [
                //homem questionando
                SizedBox(
                  child: SizedBox(
                    child: Image.asset('assets/ladoDireto.png'),
                  ),
                ),
                BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is PrimaryInitialState) {
                        return const Positioned(
                          top: 25,
                          right: 38,
                          child: Text(
                            'É importante \nresponder',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      } else if (state is PrimaryLoadingState) {
                        return const Positioned(
                          right: 70,
                          top: 40,
                          child: Text(
                            '...',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      } else if (state is PrimaryLoadedState) {
                        return const Positioned(
                          left: 30,
                          top: 5,
                          child: Text(
                            'Que bom \nque voce \ndeu o primeiro \npasso!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 12),
                          ),
                        );
                      } else {
                        return const Text('ERRO');
                      }
                    })
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 50,
            right: 50,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(84, 255, 255, 255),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Voce é \nHomem ou Mulher?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 350,
              child: ListenableBuilder(
                listenable: desativarButton,
                builder: (context, child) {
                  return ElevatedButton(
                    onPressed: desativarButton.value
                        ? null
                        : () async {
                            desativarButton.value = !desativarButton.value;
                            await cubit.primaryAsk();
                            await Future.delayed(
                              const Duration(seconds: 2),
                            );
                            desativarButton.value = !desativarButton.value;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SecondAsk(homem: true),
                              ),
                            );
                          },
                    child: const Text(
                      'HOMEM',
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: SizedBox(
                width: 350,
                child: ListenableBuilder(
                  listenable: desativarButton,
                  builder: (context, child) {
                    return ElevatedButton(
                      onPressed: desativarButton.value
                          ? null
                          : () async {
                              desativarButton.value = !desativarButton.value;
                              await cubit.primaryAsk();

                              await Future.delayed(
                                const Duration(seconds: 2),
                              );
                              desativarButton.value = !desativarButton.value;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SecondAsk(homem: false),
                                ),
                              );
                            },
                      child: const Text(
                        'MULHER',
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
