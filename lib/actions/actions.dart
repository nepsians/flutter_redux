import 'package:redux_app_example/models/todo.dart';

class LoadTodosAction {}

class TodosNotLoadedAction {}

class TodosLoadedAction {
  final List<Todo> todos;

  TodosLoadedAction(this.todos);
}

class UpdateTodoAction {
  final String id;
  final Todo updatedTodo;

  UpdateTodoAction(this.id, this.updatedTodo);
}

class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);
}

class DeteteTodoAction {
  final String id;

  DeteteTodoAction(this.id);
}
