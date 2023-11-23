import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../data/storage.dart';
import '../model/todo.dart';

part 'todo_pod.g.dart';

const _uuid = Uuid();

@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [];
  }

  void add(String title) {
    if (title.isNotEmpty) {
      state = [
        ...state,
        Todo(id: _uuid.v4(), title: title),
      ];
      save(state);
    }
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
  }

  void remove(Todo target) {
    state = state.where((t) => t.id != target.id).toList();
    save(state);
  }

  Future<void> initLoad() async {
    state = await load();
  }
}
