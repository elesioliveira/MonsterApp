import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../componentes/componentes.dart';
import '../../controller/controller.dart';
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
              //headbar
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
                child: const Center(child: Text('ETAPA 2')),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: EntradaTexto(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    MaskTextFormField.peso
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    } else if (value.length >= 6) {
                      return 'Digite seu peso correto';
                    }
                    return null;
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
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  } else if (value.length >= 5) {
                    return 'Digite sua altura certa';
                  }
                  return null;
                },
                controller: homemPageController.alturaTextEditController,
                texto: 'Qual sua altura?',
                keyboardType: TextInputType.number,
                label: const Text('Digite sua altura'),
              ),
              EntradaTexto(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length >= 3) {
                    return 'Digite sua idade correta';
                  }
                  return null;
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
                    Bottom(
                      textoButtom: 'Voltar',
                      onPressed: () {
                        Navigator.pop(context); // Volta para a página anterior
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Bottom(
                      textoButtom: 'Salvar',
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
