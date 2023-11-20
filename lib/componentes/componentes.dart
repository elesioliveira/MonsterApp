import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyfromText extends StatefulWidget {
  MyfromText({super.key, this.labelText, this.hintText, this.suffixIcon});

  String? labelText;
  String? hintText;
  Widget? suffixIcon;

  @override
  State<MyfromText> createState() => _MyfromTextState();
}

class _MyfromTextState extends State<MyfromText> {
  Widget? prefix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: ColorPalette.primaria,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          decoration: InputDecoration(
              icon: const Padding(
                padding: EdgeInsets.only(left: 5),
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              contentPadding: const EdgeInsets.all(8),
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              floatingLabelStyle: const TextStyle(color: Colors.black),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent))),
        ),
      ),
    );
  }
}

abstract class ColorPalette {
  static const Color primaria = Color(0XFF145C1F);
  static const Color quinta = Color(0XFF01542D);
  static const Color quarta = Color(0xFF1D852D);
  static const Color secundaria = Color(0xFF26AD3A);
  static const Color gordura = Color(0xFF3e4700);
}

class BottomPositivo extends StatelessWidget {
  BottomPositivo({super.key, this.onPressed, required this.textoButtom});
  void Function()? onPressed;
  late final String textoButtom;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(10),
        shadowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // Cor da sombra quando o botão é pressionado
            return Colors.green;
          }
          // Cor da sombra em outros estados
          return Colors.blue;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              // Cor de fundo quando o botão está desativado
              return Colors.grey; // Cor desejada
            }
            if (states.contains(MaterialState.pressed)) {
              // Cor de fundo quando o botão está pressionado
              return ColorPalette.primaria; // Cor desejada
            }
            // Cor de fundo padrão
            return Colors.white; // Cor desejada
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(
        textoButtom,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class BottomNegativo extends StatelessWidget {
  BottomNegativo({super.key, this.onPressed, required this.textoButtom});
  void Function()? onPressed;
  late final String textoButtom;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(10),
        shadowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            // Cor da sombra quando o botão é pressionado
            return Colors.green;
          }
          // Cor da sombra em outros estados
          return Colors.blue;
        }),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              // Cor de fundo quando o botão está desativado
              return Colors.white; // Cor desejada
            }
            if (states.contains(MaterialState.pressed)) {
              // Cor de fundo quando o botão está pressionado
              return null; // Cor desejada
            }
            // Cor de fundo padrão
            return Colors.white; // Cor desejada
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(
        textoButtom,
        style: const TextStyle(color: ColorPalette.primaria),
      ),
    );
  }
}

class EntradaTexto extends StatefulWidget {
  EntradaTexto(
      {super.key,
      this.label,
      this.keyboardType,
      required this.texto,
      this.onSaved,
      this.controller,
      this.validator,
      this.inputFormatters});
  Widget? label;
  TextInputType? keyboardType;
  String texto;
  void Function(String?)? onSaved;
  TextEditingController? controller;
  String? Function(String?)? validator;
  List<TextInputFormatter>? inputFormatters;

  @override
  State<EntradaTexto> createState() => _EntradaTextoState();
}

class _EntradaTextoState extends State<EntradaTexto> {
  final removeEmailVisibilityNotifier = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    widget.texto,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListenableBuilder(
                  listenable: removeEmailVisibilityNotifier,
                  builder: (context, child) {
                    return TextFormField(
                      validator: widget.validator,
                      onSaved: widget.onSaved,
                      inputFormatters: widget.inputFormatters,
                      onChanged: (value) {
                        removeEmailVisibilityNotifier.value = value.isEmpty;
                      },
                      controller: widget.controller,
                      keyboardType: widget.keyboardType,
                      decoration: InputDecoration(
                        suffixIcon: removeEmailVisibilityNotifier.value
                            ? null
                            : IconButton(
                                onPressed: () {
                                  widget.controller!.clear();
                                  removeEmailVisibilityNotifier.value =
                                      !removeEmailVisibilityNotifier.value;
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromARGB(255, 121, 35, 28),
                                ),
                              ),
                        label: widget.label,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            gapPadding: 5),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class MaskTextFormField {
  static var telefoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) ####-####', filter: {"#": RegExp(r'[0-9]')});

  static var peso =
      MaskTextInputFormatter(mask: '##.##', filter: {"#": RegExp(r'[0-9]')});
  static var altura =
      MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});
  static var idade =
      MaskTextInputFormatter(mask: '##', filter: {"#": RegExp(r'[0-9]')});
}

class ChartData {
  ChartData(this.category, this.value, this.color);
  final String category;
  final int value;
  final Color color;
}
