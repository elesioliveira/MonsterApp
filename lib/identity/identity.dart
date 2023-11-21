import 'package:flutter/material.dart';

class HomemPageController extends ChangeNotifier {
  TextEditingController alturaTextEditController = TextEditingController();
  TextEditingController pesoTextEditController = TextEditingController();
  TextEditingController idadeTextEditController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusScopeNode focusScopeNode = FocusScopeNode();
  late bool homem;

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
    if (homem == true) {
      double tmbCalc = 88.36;
      double pesoCalc = 13.39 * peso;
      double alturaCalc = 4.79 * altura;
      double idadeCalc = 5.67 * idade;
      double result = tmbCalc + pesoCalc + alturaCalc - idadeCalc;
      return result;
    } else {
      double tmbCalc = 447.593;
      double pesoCalc = 9.247 * peso;
      double alturaCalc = 3.098 * altura;
      double idadeCalc = 4.330 * idade;
      double result = tmbCalc + pesoCalc + alturaCalc - idadeCalc;
      return result;
    }
  }

  setGenero(bool value) {
    homem = value;
  }

  double get tbmSedentario {
    if (homem == true) {
      return tbm * 1.2;
    } else {
      return tbm * 1.2;
    }
  }

  double get tbmLevementeAtivo {
    if (homem == true) {
      return tbm * 1.375;
    } else {
      return tbm * 1.375;
    }
  }

  double get tbmModeradamenteAtivo {
    if (homem == true) {
      return tbm * 1.55;
    } else {
      return tbm * 1.55;
    }
  }

  double get tbmMuitoAtivo {
    if (homem == true) {
      return tbm * 1.725;
    } else {
      return tbm * 1.725;
    }
  }

  double get tbmExtremamenteAtivo {
    if (homem == true) {
      return tbm * 1.9;
    } else {
      return tbm * 1.9;
    }
  }

  double get proteinasMin {
    if (homem == true) {
      return peso * 1.6;
    } else {
      return peso * 0.8;
    }
  }

  double get proteinasMax {
    if (homem == true) {
      return peso * 2.2;
    } else {
      return peso * 1.2;
    }
  }

  double get carboMin {
    if (homem == true) {
      return peso * 3;
    } else {
      return peso * 3;
    }
  }

  double get carboMax {
    if (homem == true) {
      return peso * 7;
    } else {
      return peso * 6;
    }
  }

  double get gorduraSendentario {
    if (homem == true) {
      return tbmSedentario * 0.35;
    } else {
      return tbmSedentario * 0.35;
    }
  }

  double get gorduraLevementeAtivo {
    if (homem == true) {
      return tbmLevementeAtivo * 0.35;
    } else {
      return tbmLevementeAtivo * 0.35;
    }
  }

  double get gorduraModeradamente {
    if (homem == true) {
      return tbmModeradamenteAtivo * 0.35;
    } else {
      return tbmModeradamenteAtivo * 0.35;
    }
  }

  double get gorduraMuito {
    if (homem == true) {
      return tbmMuitoAtivo * 0.35;
    } else {
      return tbmMuitoAtivo * 0.35;
    }
  }

  double get gorduraExtremamente {
    if (homem == true) {
      return tbmExtremamenteAtivo * 0.35;
    } else {
      return tbmExtremamenteAtivo * 0.35;
    }
  }
}
