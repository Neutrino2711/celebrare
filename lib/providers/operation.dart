import 'package:flutter/material.dart';

class TaskState {
  final String text;
  final Color color;
  final Offset position;
  final int fontSize;
  final String fontFamily;

  TaskState(
      {required this.text,
      required this.color,
      required this.position,
      required this.fontSize,
      required this.fontFamily});
}

class TaskStateHistory {
  List<TaskState> _history = [];
  int _currentTaskStateIndex = -1;

  void addTaskState(TaskState taskState) {
    if (_currentTaskStateIndex < _history.length - 1) {
      _history = _history.sublist(0, _currentTaskStateIndex + 1);
    }
    _history.add(taskState);
    _currentTaskStateIndex++;
  }

  TaskState? undo() {
    print(_history);
    if (_currentTaskStateIndex > 0) {
      _currentTaskStateIndex--;

      return _history[_currentTaskStateIndex];
    } else
      return null;
  }

  TaskState? redo() {
    if (_currentTaskStateIndex < _history.length - 1) {
      _currentTaskStateIndex++;
      return _history[_currentTaskStateIndex];
    }
    return null;
  }
}
