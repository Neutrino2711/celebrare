import 'package:flutter/material.dart';

class TextModel {
  int fontSize;
  String fontFamily;
  Color fontColor;
  Offset position;
  String content;
  int pageNumber;
  bool isSelected;

  TextModel({
    required this.fontSize,
    required this.fontFamily,
    required this.fontColor,
    required this.position,
    required this.content,
    required this.pageNumber,
    required this.isSelected,
  });
}