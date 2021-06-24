import 'package:meta/meta.dart';

@immutable
class Todo {
  final bool complete;
  final String id;
  final String note;
  final String task;

  Todo(this.task, {this.complete = false, String note = '', String id})
      : note = note ?? '',
        id = id ?? "123";

  Todo copyWith({bool complete, String id, String note, String task}) {
    return Todo(task ?? this.task,
        complete: complete ?? this.complete,
        id: id ?? this.id,
        note: note ?? this.note);
  }
}
