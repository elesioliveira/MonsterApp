import 'package:flutter_bloc/flutter_bloc.dart';

import '../homePage/cubits/todo_cubits.dart';
import '../homePage/Home/primaryAsk/cubits/todo_cubits.dart';

final blocProvider1 = BlocProvider<PrimaryAskCubit>(
  create: (context) => PrimaryAskCubit(),
);

final blocProvider2 = BlocProvider<TodoCubit>(
  create: (context) => TodoCubit(),
);
