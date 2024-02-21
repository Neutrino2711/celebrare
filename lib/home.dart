import 'dart:math';
import 'package:flutter/material.dart';

import 'drag.dart';
import 'color_palette.dart';

import 'package:provider/provider.dart';
import '../providers/appdata_provider.dart';
import 'providers/operation.dart';
import '../providers/textstate.dart';

class Celebrare extends StatelessWidget {
  Celebrare({super.key});

  final List<String> fontsList = [
    'Roboto',
    'DancingScript',
    'Workbench',
  ];

  final List<int> fontSizes = [
    10,
    20,
    30,
    40,
    50,
  ];

  TextEditingController textcontroller = TextEditingController();
  TaskState? taskState;

  @override
  Widget build(BuildContext context) {
    BoxConstraints constraints;

    String dropdownVal = fontSizes.first.toString();
    final appdataProvider = Provider.of<AppDataProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MyHomePage()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  appdataProvider.undo();
                  //   taskState = appdataProvider.undo();
                  //   // print(taskState!.index);
                  //   // appdataProvider.selectedIndx = taskState!.index;
                  //   if (taskState == null) {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           content: Text("No more undo's"),
                  //           actions: <Widget>[
                  //             TextButton(
                  //               child: Text('Close'),
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   } else {
                  //     appdataProvider.selectedIndx = taskState!.index;
                  //     appdataProvider.font_sizes[taskState!.index] =
                  //         taskState!.fontSize;
                  //     appdataProvider.font_families[taskState!.index] =
                  //         taskState!.fontFamily;
                  //     appdataProvider.font_colors[taskState!.index] =
                  //         taskState!.color;
                  //     appdataProvider.positions[taskState!.index] =
                  //         taskState!.position;
                  //     appdataProvider.texts[taskState!.index] = taskState!.text;
                  //   }
                },
                child: Text('Undo'),
              ),
              ElevatedButton(
                onPressed: () {
                  appdataProvider.redo();
                  // taskState = appdataProvider.redo();
                  // if (taskState == null) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return AlertDialog(
                  //         content: Text("No more redo's possible"),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             child: Text('Close'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //         ],
                  //       );
                  //     },
                  //   );
                  // } else {
                  //   appdataProvider.selectedIndx = taskState!.index;
                  //   appdataProvider.font_sizes[appdataProvider.selectedIndx] =
                  //       taskState!.fontSize;
                  //   appdataProvider
                  //           .font_families[appdataProvider.selectedIndx] =
                  //       taskState!.fontFamily;
                  //   appdataProvider.font_colors[appdataProvider.selectedIndx] =
                  //       taskState!.color;
                  //   appdataProvider.positions[appdataProvider.selectedIndx] =
                  //       taskState!.position;
                  //   appdataProvider.texts[appdataProvider.selectedIndx] =
                  //       taskState!.text;
                  // }
                },
                child: Text('Redo'),
              ),
            ],
          ),
          Row(
            children: [
              // NumIncDec(),
              DropdownButton(
                  value: appdataProvider
                      .getText(appdataProvider.selectedId)
                      .fontSize,
                  items: fontSizes.map<DropdownMenuItem<int>>((int val) {
                    return DropdownMenuItem<int>(
                      value: val,
                      child: Text(val.toString()),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (appdataProvider.selectedId != -1) {
                      TextModel textModel =
                          appdataProvider.getText(appdataProvider.selectedId);
                      appdataProvider.updateText(
                          textModel.id, textModel.copyWith(fontSize: val!));
                    }
                    // appdataProvider.set_font_size(val!, 0);
                    // appdataProvider.addTask(
                    //   appdataProvider.getText(appdataProvider.getIdx),
                    //   appdataProvider.getFontFamily(appdataProvider.getIdx),
                    //   appdataProvider.getFontColor(appdataProvider.getIdx),
                    //   appdataProvider.getFontSize(appdataProvider.getIdx),
                    //   appdataProvider.get_position(appdataProvider.getIdx),
                    //   appdataProvider.getIdx,
                    // );
                  }),
              Spacer(),
              DropdownButton(
                  value: appdataProvider
                      .getText(appdataProvider.selectedId)
                      .fontFamily,
                  items: fontsList.map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (appdataProvider.selectedId != -1) {
                      TextModel textModel =
                          appdataProvider.getText(appdataProvider.selectedId);
                      appdataProvider.updateText(
                          textModel.id, textModel.copyWith(fontFamily: val!));
                    }
                    // appdataProvider.set_font_family(val!, 0);
                    // appdataProvider.addTask(
                    //   appdataProvider.getText(appdataProvider.getIdx),
                    //   appdataProvider.getFontFamily(appdataProvider.getIdx),
                    //   appdataProvider.getFontColor(appdataProvider.getIdx),
                    //   appdataProvider.getFontSize(appdataProvider.getIdx),
                    //   appdataProvider.get_position(appdataProvider.getIdx),
                    //   appdataProvider.getIdx,
                    // );
                  }),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ColorPalette();
                  });
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
              appdataProvider.getText(appdataProvider.selectedId).fontColor,
            )),
            child: const Text('Select Color'),
          ),

          // Row(
          //   children: [
          // NumberInputWithIncrementDecrement(
          //     scaleWidth: 0.3, controller: TextEditingController()),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textcontroller,
              style: const TextStyle(
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Text',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  appdataProvider.addText(0);
                  // appdataProvider.addTextModel(TextModel(
                  //     fontSize: 30,
                  //     fontFamily: 'Roboto',
                  //     fontColor: Colors.grey,
                  //     position:
                  //         Offset(Random().nextInt(200 - 100).toDouble(), 100),
                  //     content: "NewText",
                  //     pageNumber: 0,
                  //     isSelected: true));
                  // appdataProvider.addNewTextWidget(
                  //     appdataProvider.getTextList.last.position,
                  //     appdataProvider.getTextList.length - 1);
                  // print(appdataProvider.getTextList.length - 1);
                  // appdataProvider.add_text(textcontroller.text,0);
                  // appdataProvider.addTask(
                  //      appdataProvider.getText(appdataProvider.getIdx),
                  //       appdataProvider.getFontFamily(appdataProvider.getIdx),
                  //       appdataProvider.getFontColor(appdataProvider.getIdx),
                  //       appdataProvider.getFontSize(appdataProvider.getIdx),
                  //       appdataProvider.get_position(appdataProvider.getIdx),
                  //     appdataProvider.getIdx,
                  //     );
                },
                child: const Text('L Add Text'),
              ),
              ElevatedButton(
                onPressed: () {
                  appdataProvider.addText(1);

                  // appdataProvider.replace_text(textcontroller.text);
                  // appdataProvider.addTask(
                  //   appdataProvider.getText(appdataProvider.getIdx),
                  //   appdataProvider.getFontFamily(appdataProvider.getIdx),
                  //   appdataProvider.getFontColor(appdataProvider.getIdx),
                  //   appdataProvider.getFontSize(appdataProvider.getIdx),
                  //   appdataProvider.get_position(appdataProvider.getIdx),
                  //   appdataProvider.getIdx,
                  // );
                },
                child: const Text('Add Text'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
