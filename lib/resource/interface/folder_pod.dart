import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../model/folder.dart';
import '../model/todo.dart';

part 'folder_pod.g.dart';

const _uuid = Uuid();

@riverpod
class FolderList extends _$FolderList {
  @override
  List<Folder> build() {
    return [];
  }

  void addFolder(String title) {
    state = [
      ...state,
      Folder(id: _uuid.v4(), title: title),
    ];
  }

  void editFolder({required String id, required String title}) {
    state = [
      for (final folder in state)
        if (folder.id == id) folder.copyWith(title: title) else folder,
    ];
  }

  void removeFolder(Folder target) {
    state = state.where((t) => t.id != target.id).toList();
  }

  void addTodo(String title, String id) {
    state = [
      for (final f in state)
        if (f.id == id)
          f.copyWith(todos: [...f.todos, Todo(id: _uuid.v4(), title: title)])
        else
          f
    ];
  }
}
