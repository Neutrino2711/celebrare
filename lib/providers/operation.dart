import 'package:flutter/material.dart';

class TaskState {
  final String text;
  final Color color;
  final Offset position;
  final int fontSize;
  final String fontFamily;
  final int index;

  TaskState(
      {required this.text,
      required this.color,
      required this.position,
      required this.fontSize,
      required this.fontFamily,
      required this.index});
}

class TaskStateHistory {
  List<TaskState> _history = [];
  int _currentTaskStateIndex = -1;

  void addTaskState(TaskState taskState) {
    // if (_currentTaskStateIndex < _history.length - 1) {
    //   _history = _history.sublist(0, _currentTaskStateIndex + 1);
    // }
    _history.length = _currentTaskStateIndex + 1;
  
    _history.add(taskState);
    print(_history.length);
    _currentTaskStateIndex++;
  }

  TaskState? undo() {
    print(_history);
    print("current index$_currentTaskStateIndex");
    if (_currentTaskStateIndex > 0) {
      _currentTaskStateIndex--;

      //  print("yeah i m here undo");
      //  print(_history[_currentTaskStateIndex].position);

      print(_history.length);
      return _history[_currentTaskStateIndex];
      
     
    } else
  {
    print("no i m not here undo");
      return null;
  }
  
  }

  TaskState? redo() {
    if (_currentTaskStateIndex < _history.length - 1) {
      _currentTaskStateIndex++;
      return _history[_currentTaskStateIndex];
    }
    return null;
  }
}
