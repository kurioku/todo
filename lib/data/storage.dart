import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

import '/resource/model/todo.dart';

Future<void> save(List<Todo> todos) async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/todos.json');

  final jsonList = todos.map((t) => t.toJson()).toList();
  final jsonString = jsonEncode(jsonList);
  await file.writeAsString(jsonString);
}

Future<List<Todo>> load() async {
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/todos.json');

  if (await file.exists()) {
    final jsonString = await file.readAsString();
    final List jsonList = jsonDecode(jsonString);
    final todos = jsonList.map((t) => Todo.fromJson(t)).toList();
    return todos;
  }

  return [];
}
