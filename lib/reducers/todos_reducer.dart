import 'package:redux/redux.dart';
import 'package:redux_app_example/actions/actions.dart';
import 'package:redux_app_example/models/todo.dart';

final todosReducer = combineReducers<List<Todo>>([
  TypedReducer<List<Todo>, AddTodoAction>(_addTodo),
  TypedReducer<List<Todo>, DeteteTodoAction>(_deleteTodo),
  TypedReducer<List<Todo>, UpdateTodoAction>(_updateTodo),
  TypedReducer<List<Todo>, TodosLoadedAction>(_setLoadedTodos),
  TypedReducer<List<Todo>, TodosNotLoadedAction>(_setNoTodos),
]);

List<Todo> _addTodo(List<Todo> todos, AddTodoAction action) {
  List<Todo> todo = List.from(todos)..add(action.todo);
  print(todo);
  return todo;
}

List<Todo> _deleteTodo(List<Todo> todos, DeteteTodoAction action) {
  return todos.where((todo) => todo.id != action.id).toList();
}

List<Todo> _updateTodo(List<Todo> todos, UpdateTodoAction action) {
  print(todos
      .map((todo) => todo.id == action.id ? action.updatedTodo : todo)
      .toList());
  return todos
      .map((todo) => todo.id == action.id ? action.updatedTodo : todo)
      .toList();
}

List<Todo> _setLoadedTodos(List<Todo> todos, TodosLoadedAction action) {
  return action.todos;
}

List<Todo> _setNoTodos(List<Todo> todos, TodosNotLoadedAction action) {
  return [];
}
