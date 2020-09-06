// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_project_page_vm.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailProjectPageVm on DetailProjectPageVmBase, Store {
  final _$tasksAtom = Atom(name: 'DetailProjectPageVmBase.tasks');

  @override
  List<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$getTasksAsyncAction = AsyncAction('DetailProjectPageVmBase.getTasks');

  @override
  Future<void> getTasks(String projectId) {
    return _$getTasksAsyncAction.run(() => super.getTasks(projectId));
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
