pesoValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  } else if (value.length >= 6) {
    return 'Digite seu peso correto';
  }
  return null;
}

alturaValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  } else if (value.length >= 5) {
    return 'Digite sua altura certa';
  }
  return null;
}

idadeValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Campo obrigatório';
  }
  if (value.length >= 3) {
    return 'Digite sua idade correta';
  }
  return null;
}
