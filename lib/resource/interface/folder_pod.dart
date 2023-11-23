import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../model/folder.dart';

part 'folder_pod.g.dart';

const _uuid = Uuid();

@riverpod
class FolderList extends _$FolderList {
  @override
  List<Folder> build() {
    return [];
  }

  void add(String title) {
    state = [
      ...state,
      Folder(id: _uuid.v4(), title: title),
    ];
  }

  void edit({required String id, required String title}) {
    state = [
      for (final folder in state)
        if (folder.id == id) folder.copyWith(title: title) else folder,
    ];
  }

  void remove(Folder target) {
    state = state.where((t) => t.id != target.id).toList();
  }
}
