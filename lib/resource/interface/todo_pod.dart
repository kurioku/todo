import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo/data/storage.dart';
import 'package:uuid/uuid.dart';

import '/main.dart';
import '/core/router/router.dart';
import '../model/todo.dart';

part 'todo_pod.g.dart';

const _uuid = Uuid();

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return todos;
  }

  void add(String title) {
    if (title.isNotEmpty) {
      state = [
        ...state,
        Todo(id: _uuid.v4(), title: title),
      ];
      save(state);
    }
    router.pop();
  }

  void check(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(check: !todo.check) else todo,
    ];
    save(state);
  }

  void edit({required String id, required String title}) {
    if (title.isNotEmpty) {
      state = [
        for (final todo in state)
          if (todo.id == id) todo.copyWith(title: title) else todo,
      ];
      save(state);
    }
    router.pop();
  }

  void remove(Todo target) {
    state = state.where((t) => t.id != target.id).toList();
    save(state);
  }
}

@riverpod
List<Todo> active(ActiveRef ref) {
  return ref.watch(todosPod).where((t) => !t.check).toList();
}

@riverpod
List<Todo> completed(CompletedRef ref) {
  return ref.watch(todosPod).where((t) => t.check).toList();
}
