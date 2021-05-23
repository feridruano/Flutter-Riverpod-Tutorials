import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Todo {
  final String id;
  final String description;
  final bool completed;

  Todo(this.description, {String? id, this.completed = false})
      : id = id ?? _uuid.v4();

  @override
  String toString() {
    return 'Id: $id, Description: $description, Completed: $completed';
  }
}
