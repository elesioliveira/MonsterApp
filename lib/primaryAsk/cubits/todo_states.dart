// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class PrimaryAskTodoState {
  bool? botaoDesabilitado = false;
}

class PrimaryInitialState extends PrimaryAskTodoState {}

class PrimaryLoadingState extends PrimaryAskTodoState {}

class PrimaryLoadedState extends PrimaryAskTodoState {}
