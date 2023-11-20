import 'package:bloc/bloc.dart';

import 'todo_states.dart';

class PrimaryAskCubit extends Cubit<PrimaryAskTodoState> {
  bool buttomDesabilitado = false;
  PrimaryAskCubit() : super(PrimaryInitialState());

  Future<void> primaryAsk() async {
    emit(PrimaryLoadingState());
    buttomDesabilitado = !buttomDesabilitado;
    await Future.delayed(const Duration(seconds: 2));

    emit(PrimaryLoadedState());
  }
}
