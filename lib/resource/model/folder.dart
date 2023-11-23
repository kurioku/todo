import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
class Folder with _$Folder {
  factory Folder({
    required String title,
    @Default([]) List<Todo> todos,
  }) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}
