import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monster_app/componentes/todos.dart';

import '../../../../componentes/componentes.dart';
import '../../../../controller/controller.dart';
import 'homem/ativoFisico/atividadeFisica/tipo_ativo_page.dart';

class SecondAsk extends StatefulWidget {
  const SecondAsk({
    super.key,
  });

  @override
  State<SecondAsk> createState() => _SecondAskState();
}

class _SecondAskState extends State<SecondAsk> {
  final HomemPageController homemPageController = HomemPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: homemPageController.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: EntradaTexto(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    MaskTextFormField.peso
                  ],
                  validator: (value) {
                    return peso(value);
                  },
                  controller: homemPageController.pesoTextEditController,
                  texto: 'Qual seu peso?',
                  keyboardType: TextInputType.number,
                  label: const Text('Digite seu peso'),
                ),
              ),
              EntradaTexto(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  MaskTextFormField.altura,
                ],
                validator: (value) {
                  return altura(value);
                },
                controller: homemPageController.alturaTextEditController,
                texto: 'Qual sua altura?',
                keyboardType: TextInputType.number,
                label: const Text('Digite sua altura'),
              ),
              EntradaTexto(
                validator: (value) {
                  return idade(value);
                },
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  MaskTextFormField.idade,
                ],
                controller: homemPageController.idadeTextEditController,
                texto: 'Quantos anos voce tem?',
                keyboardType: TextInputType.number,
                label: const Text('Digite sua idade'),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BottomNegativo(
                      textoButtom: 'VOLTAR',
                      onPressed: () {
                        Navigator.pop(context); // Volta para a página anterior
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    BottomPositivo(
                      textoButtom: 'SALVAR',
                      onPressed: () {
                        homemPageController.focusScopeNode.unfocus();
                        if (homemPageController.formKey.currentState!
                            .validate()) {
                          homemPageController.formKey.currentState!
                              .save(); // Aqui você pode processar os dados do formulário

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TipoAtivo(
                                gorduraDiariaExtremamente:
                                    homemPageController.gorduraExtremamente,
                                gorduraDiariaLevemente:
                                    homemPageController.gorduraLevementeAtivo,
                                gorduraDiariaModeradamente:
                                    homemPageController.gorduraModeradamente,
                                gorduraDiariaMuito:
                                    homemPageController.gorduraMuito,
                                gorduraDiariaSedentario:
                                    homemPageController.gorduraSendentario,
                                carboMax: homemPageController.carboMax,
                                carboMin: homemPageController.carboMin,
                                proteinasMin: homemPageController.proteinasMin,
                                proteinasMax: homemPageController.proteinasMax,
                                tbm: homemPageController.tbm,
                                tbmSedentario:
                                    homemPageController.tbmSedentario,
                                tbmLevementeAtivo:
                                    homemPageController.tbmLevementeAtivo,
                                tbmModeradamenteAtivo:
                                    homemPageController.tbmModeradamenteAtivo,
                                tbmMuitoAtivo:
                                    homemPageController.tbmMuitoAtivo,
                                tbmExtremamenteAtivo:
                                    homemPageController.tbmExtremamenteAtivo,
                                peso: homemPageController.peso,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
