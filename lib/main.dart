import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bindings/bindings.dart';
import 'componentes/componentes.dart';

import 'homePage/pageView/home_view.dart';

void main() {
  debugPaintSizeEnabled = false; // Ativar debug painting de tamanhos
  debugPaintBaselinesEnabled = false; // Ativar debug painting de baselines
  debugPaintLayerBordersEnabled =
      false; // Ativar debug painting de bordas de camada
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        blocProvider1,
        blocProvider2,
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme:
                ColorScheme.fromSeed(seedColor: ColorPalette.primaria)),
        home: const MyHomePage(),
      ),
    );
  }
}
