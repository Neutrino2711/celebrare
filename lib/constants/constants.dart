import '../providers/textstate.dart';
import 'package:flutter/material.dart';

final List<TextModel> textModels = List<TextModel>.generate(
  6,
  (index) => TextModel(
    fontSize: 30,
    fontFamily: 'Roboto',
    fontColor: Colors.grey,
    position: Offset(index * 10.0, index * 20.0),
    content: 'Text $index',
    pageNumber: index,
    isSelected: false,
  ),
);