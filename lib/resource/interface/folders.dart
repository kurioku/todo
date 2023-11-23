import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/folder.dart';

part 'folders.g.dart';

@riverpod
class Folders extends _$Folders {
  @override
  List<Folder> build() {
    return [];
  }

  void addFolder(String title) {
    state = [
      ...state,
      Folder(title: title),
    ];
  }
}
