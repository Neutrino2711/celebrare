import 'dart:math';

import 'package:celebrare_assignment/models/changes.dart';
import 'package:celebrare_assignment/providers/textstate.dart';
import 'package:flutter/material.dart';

class AppDataProvider extends ChangeNotifier {
  final List<TextModel> text = [];
  final List<Changes> changes = [];
  int changeIndex = -1;
  int selectedId = -1;

  void setSelectedId(int id) {
    selectedId = id;
    notifyListeners();
  }

  void addText(int pageNumber) {
    text.add(TextModel(
      id: text.length,
      fontSize: 30,
      fontFamily: 'Roboto',
      fontColor: Colors.grey,
      position: Offset(Random().nextInt(200 - 100).toDouble(), 100),
      content: "NewText",
      pageNumber: pageNumber,
    ));
    changes.length = changeIndex + 1;
    changeIndex++;
    changes.add(Changes(
      created: true,
      oldModel: null,
      newModel: text.last,
    ));
    // changes.add(Changes(created: true, oldModel: text.last));
    notifyListeners();
  }

  List<TextModel> getPageText(int pageNumber) {
    return text.where((element) => element.pageNumber == pageNumber).toList();
  }

  TextModel getText(int id) {
    if (id == -1) {
      return TextModel(
        id: -1,
        fontSize: 30,
        fontFamily: 'Roboto',
        fontColor: Colors.grey,
        position: Offset(0, 0),
        content: "NewText",
        pageNumber: 0,
      );
    }
    return text[id];
  }

  void updateText(int id, TextModel textModel) {
    changes.length = changeIndex + 1;
    changeIndex++;
    changes.add(Changes(
      created: false,
      oldModel: text[id],
      newModel: textModel,
    ));
    text[id] = textModel;
    notifyListeners();
  }

  void undo() {
    selectedId = -1;
    if (changeIndex >= 0) {
      if (changes[changeIndex].created) {
        text.removeLast();
      } else {
        text[changes[changeIndex].oldModel!.id] =
            changes[changeIndex].oldModel!;
      }
      changeIndex--;
      notifyListeners();
    }
  }

  void redo() {
    if (changeIndex < changes.length - 1) {
      changeIndex++;
      if (changes[changeIndex].created) {
        text.add(changes[changeIndex].newModel!);
      } else {
        text[changes[changeIndex].newModel!.id] =
            changes[changeIndex].newModel!;
      }
      notifyListeners();
    }
  }

  void reorderPages(List<int> newOrder) {
    List<TextModel> newText = [];
    for (int i = 0; i < newOrder.length; i++) {
      text.forEach((element) {
        if (element.pageNumber == newOrder[i]) {
          newText.add(element.copyWith(pageNumber: i));
        }
      });
    }
    text.clear();
    text.addAll(newText);
    // modifyChangesOnPageReorder(newOrder);
    notifyListeners();
  }

  void modifyChangesOnPageReorder(List<int> newOrder) {
    List<Changes> newChanges = [...changes];
    for (int i = 0; i < newOrder.length; i++) {
      for (final (index, element) in changes.indexed) {
        if (element.oldModel != null) {
          if (element.oldModel!.pageNumber == newOrder[i]) {
            newChanges[index].oldModel =
                newChanges[index].oldModel!.copyWith(pageNumber: i);
          }
        }
        if (element.newModel != null) {
          if (element.newModel!.pageNumber == newOrder[i]) {
            newChanges[index].newModel =
                newChanges[index].newModel!.copyWith(pageNumber: i);
          }
        }
      }
    }
    changes.clear();
    changes.addAll(newChanges);
    notifyListeners();
  }
}
