import 'package:flutter/material.dart';

import '../providers/operation.dart';

class AppDataProvider extends ChangeNotifier {
  final TaskStateHistory history = TaskStateHistory();

  int font_size = 30;
  String font_family = "Roboto";
  Color font_color = Colors.red;
  Offset position = Offset(0, 0);
  String text = "";

  int get get_font_size => font_size;
  String get get_font_family => font_family;
  Color get get_font_color => font_color;
  Offset get get_position => position;
  String get get_text => text;

  void inc_font_size() {
    font_size++;
    notifyListeners();
  }

  void dec_font_size() {
    font_size--;
    notifyListeners();
  }
  void set_font_size(int size) {
    // print(font);
    font_size = size;
    notifyListeners();
  }

  void set_font_family(String font) {
    print(font);
    font_family = font;
    notifyListeners();
  }

  void set_font_color(Color color) {
    font_color = color;
    notifyListeners();
  }

  void set_position(Offset pos) {
    position = pos;
    notifyListeners();
  }

  void replace_text(String new_text) {
    text = new_text;
    notifyListeners();
  }

  void add_text(String new_text) {
    text += new_text;
    notifyListeners();
  }

  void addTask(
      String text, String fontFamily, Color color, int fontSize, Offset pos) {
    history.addTaskState(TaskState(
        text: text,
        color: color,
        position: pos,
        fontSize: fontSize,
        fontFamily: fontFamily));

    notifyListeners();
  }

  TaskState? undo() {
    final undoneState = history.undo();
    if (undoneState != null) {
      print("yes");
      notifyListeners();
    }
    return undoneState;
  }

  TaskState? redo() {
    final redoneState = history.redo();
    if (redoneState != null) {
      notifyListeners();
    }
    return redoneState;
  }
}
