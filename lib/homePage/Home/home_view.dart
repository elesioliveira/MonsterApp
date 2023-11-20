import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'primaryAsk/primary_ask_page.dart';
import '../../componentes/componentes.dart';
import '../cubits/todo_cubits.dart';
import '../cubits/todo_states.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TodoCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<TodoCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primaria,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: 20,
            child: Image.asset('assets/monster.png'),
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 15,
              child: const Center(
                child: Text(
                  'Seu aplicativo para calcular o ganho e perca de peso',
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 15,
                      color: Colors.white),
                ),
              )),
          Center(
            child: SizedBox(
              width: 200,
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is InitialTodoState) {
                    return BottomPositivo(
                      onPressed: () async {
                        await cubit.funcTodo();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const PrimaryAsk(),
                          ),
                        );
                      },
                      textoButtom: 'ENTRAR',
                    );
                  } else if (state is LoadingTodosState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else {
                    return const Text('ERRO');
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
