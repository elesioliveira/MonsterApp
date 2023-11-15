import 'package:flutter/material.dart';

class HomemPageController extends ChangeNotifier {
  TextEditingController alturaTextEditController = TextEditingController();
  TextEditingController pesoTextEditController = TextEditingController();
  TextEditingController idadeTextEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusScopeNode focusScopeNode = FocusScopeNode();

  double get peso {
    return double.tryParse(pesoTextEditController.text) ?? 0;
  }

  double get altura {
    return double.tryParse(alturaTextEditController.text) ?? 0;
  }

  double get idade {
    return double.tryParse(idadeTextEditController.text) ?? 0;
  }

  double get tbm {
    double tmbCalc = 88.36;
    double pesoCalc = 13.39 * peso;
    double alturaCalc = 4.79 * altura;
    double idadeCalc = 5.67 * idade;
    double result = tmbCalc + pesoCalc + alturaCalc - idadeCalc;
    return result;
  }

  double get tbmSedentario {
    return tbm * 1.2;
  }

  double get tbmLevementeAtivo {
    return tbm * 1.375;
  }

  double get tbmModeradamenteAtivo {
    return tbm * 1.55;
  }

  double get tbmMuitoAtivo {
    return tbm * 1.725;
  }

  double get tbmExtremamenteAtivo {
    return tbm * 1.9;
  }

  double get proteinasMin {
    return peso * 1.6;
  }

  double get proteinasMax {
    return peso * 2.2;
  }

  double get carboMin {
    return peso * 3;
  }

  double get carboMax {
    return peso * 7;
  }
}
