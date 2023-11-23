import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../model/todo.dart';

part 'todo_pod.g.dart';

const _uuid = Uuid();

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [];
  }

  void add(String title) {
    state = [
      ...state,
      Todo(id: _uuid.v4(), title: title),
    ];
  }

  void check(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(check: !todo.check) else todo,
    ];
  }

  void edit({required String id, required String title}) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(title: title) else todo,
    ];
  }

  void remove(Todo target) {
    state = state.where((t) => t.id != target.id).toList();
  }
}
