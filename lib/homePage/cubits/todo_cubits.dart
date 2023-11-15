import 'package:bloc/bloc.dart';

import 'todo_states.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitialTodoState());

  Future<void> funcTodo() async {
    emit(LoadingTodosState());

    await Future.delayed(const Duration(seconds: 4));

    emit(InitialTodoState());
  }
}
