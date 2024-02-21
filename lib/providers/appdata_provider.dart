import 'package:flutter/material.dart';

import '../providers/operation.dart';

class AppDataProvider extends ChangeNotifier {
  final TaskStateHistory history = TaskStateHistory();

 
  List<int> font_sizes = [30,30,30,30,30,30];
 
  List<String> font_families = ["Roboto","Roboto","Roboto","Roboto","Roboto","Roboto"];
 
  List<Color> font_colors = [Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey,Colors.grey];
  
  List<Offset> positions = [Offset(100, 100),Offset(200,100),Offset(100, 100),Offset(200,100),Offset(100, 100),Offset(200,100)];
 
  List<String> texts = ["Text1","Text2","Text3","Text4","Text5","Text6"];
  

  int selectedIndx = 0;
  
  List<bool> _initialized = [false,false,false,false,false,false];

  // ... rest of your code

  AppDataProvider() {
    if (!_initialized[0]) {
      initializeStates(0);
      _initialized[0] = true;
    }
  }

  void initializeStates(int index) {
    
      addTask(texts[index], font_families[index], font_colors[index], font_sizes[index], positions[index], index);
    
  }


  int get getIdx => selectedIndx;
  
  
  




  int getFontSize(int index){
 
    //   return font_size4;}
    return font_sizes[index];
  }

  String getFontFamily(int index){
  
    return font_families[index];
  }

  Color getFontColor(int index){
    
    //   return font_color4;}
    return font_colors[index];
  }
  
  String getText(int index) {

  //     return text4;}
  return texts[index];
}

Offset get_position(int index) {

return positions[index];
  
  }

  void inc_font_size() {
    font_sizes[0]++;
    notifyListeners();
  }

  void dec_font_size() {
    font_sizes[0]--;
    notifyListeners();
  }
  void set_font_size(int size,int index) {
 
    font_sizes[selectedIndx] = size;
    notifyListeners();
  }

  void setIndx(int index){
    selectedIndx = index;
    if (!_initialized[index]) {
      initializeStates(index);
      _initialized[index] = true;
    }
    notifyListeners();
  }
  


  void set_font_family(String font,int index) {

    
    font_families[selectedIndx] = font;

    print(font);
    // font_family = font;
    notifyListeners();
  }

  void set_font_color(Color color,int index) {

    font_colors[selectedIndx] = color;
    // font_color = color;
    notifyListeners();
  }


  void set_position(Offset pos,int index) {
   
    positions[index] = pos;
    notifyListeners();
  }

  void replace_text(String new_text) {
  
    texts[selectedIndx] = new_text;
    notifyListeners();
  }

  void add_text(String new_text,int index) {
   
    texts[index] += new_text;
    
    notifyListeners();
  }

  void addTask(
      String text, String fontFamily, Color color, int fontSize, Offset pos,int index) {
        
    history.addTaskState(TaskState(
        text: text,
        color: color,
        position: pos,
        fontSize: fontSize,
        fontFamily: fontFamily,
        index: index
        ));

    notifyListeners();
  }

  TaskState? undo() {
    final undoneState = history.undo();
    if (undoneState != null) {
      
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
