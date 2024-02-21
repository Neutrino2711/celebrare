// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class TextModel {
  int id;
  int fontSize;
  String fontFamily;
  Color fontColor;
  Offset position;
  String content;
  int pageNumber;

  TextModel({
    required this.id,
    required this.fontSize,
    required this.fontFamily,
    required this.fontColor,
    required this.position,
    required this.content,
    required this.pageNumber,
  });

  TextModel copyWith({
    int? id,
    int? fontSize,
    String? fontFamily,
    Color? fontColor,
    Offset? position,
    String? content,
    int? pageNumber,
  }) {
    return TextModel(
      id: id ?? this.id,
      fontSize: fontSize ?? this.fontSize,
      fontFamily: fontFamily ?? this.fontFamily,
      fontColor: fontColor ?? this.fontColor,
      position: position ?? this.position,
      content: content ?? this.content,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  String toString() {
    return 'TextModel(id: $id, fontSize: $fontSize, fontFamily: $fontFamily, fontColor: $fontColor, position: $position, content: $content, pageNumber: $pageNumber)';
  }

  @override
  bool operator ==(covariant TextModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fontSize == fontSize &&
      other.fontFamily == fontFamily &&
      other.fontColor == fontColor &&
      other.position == position &&
      other.content == content &&
      other.pageNumber == pageNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fontSize.hashCode ^
      fontFamily.hashCode ^
      fontColor.hashCode ^
      position.hashCode ^
      content.hashCode ^
      pageNumber.hashCode;
  }
}
